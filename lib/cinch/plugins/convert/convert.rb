require 'cinch'

module Cinch::Plugins
  class Convert
    include Cinch::Plugin

    self.help = "Use .convert <thing 1> to <thing 2> to do a unit conversion. (e.g. .convert 5 feet to meters)"

    match /convert (.+) to (.+)/

    def initialize(*args)
      super
      @units_path = config[:units_path] || '/usr/bin/units'
    end

    def execute(m, from, to)
      m.reply convert(from, to), true
    end

    private

    def convert(from, to)
      return "Sorry, there's a configuration issue." unless units_binary_exists?

      unless from.nil? || to.nil?
        units_output = IO.popen([@units_path, "-t", from, to])

        # we only take one line here because the first line of output is
        # either an error message or the part of the conversion output we
        # want.
        units_line = units_output.readline.chomp!

        if units_line.match(/Unknown unit/)
          "Sorry, #{units_line.downcase}."
        elsif units_line.match(/conformability error/)
          "Sorry, there was a conformability error when making that conversion."
        else
          "#{from} is #{units_line} #{to}."
        end
      end
    end

    def units_binary_exists?
      return true if File.exist? @units_path
      debug "Cinch can't find the unit conversion binary."
      false
    end
  end
end
