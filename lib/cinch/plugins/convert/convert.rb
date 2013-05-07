module Cinch::Plugins
  class Convert
    include Cinch::Plugin

    self.help = "Use .convert <thing 1> to <thing 2> to do a unit conversion. (e.g. .convert 5 feet to meters)"

    match /convert (.+)/

    def initialize(*args)
      super
      @units_path = config[:units_path] || '/usr/bin/units'
    end

    def execute(m, conversion_string)
      m.reply convert(conversion_string), true
    end

    private

    def convert(conversion)
      unless File.exist? @units_path
        debug "Cinch can't find the unit conversion binary."
        return "Sorry I can't convert that."
      end

      match = conversion.match(/([+\d\.-]+)\s*([\/*\s\w]+) to ([\/*\s\w]+)$/)

      unless match.nil?
        num = match[1]
        units_from = match[2]
        units_to = match[3]

        units_output = IO.popen([@units_path, "-t", "#{num} #{units_from}", units_to])

        # we only take one line here because the first line of output is
        # either an error message or the part of the conversion output we
        # want.
        units_line = units_output.readline
        units_line.chomp!

        if units_line =~ /Unknown unit/
          "Sorry, #{units_line.downcase}."
        elsif units_line =~ /conformability error/
          "Sorry, there was a conformability error when making that conversion."
        else
          "#{num} #{units_from} is #{units_line} #{units_to}."
        end
      else
        "Sorry, I don't understand, please use `.convert X unitname to unitname`."
      end
    end
  end
end
