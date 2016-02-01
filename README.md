# Cinch::Plugins::Convert

[![Gem Version](https://badge.fury.io/rb/cinch-convert.png)](http://badge.fury.io/rb/cinch-convert)
[![Dependency Status](https://gemnasium.com/canonical-hackers/cinch-convert.png)](https://gemnasium.com/canonical-hackers/cinch-convert)
[![Code Climate](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/badges/e33725af89d03971d9b1/gpa.svg)](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/feed)
[![Test Coverage](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/badges/e33725af89d03971d9b1/coverage.svg)](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/coverage)
[![Issue Count](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/badges/e33725af89d03971d9b1/issue_count.svg)](https://codeclimate.com/repos/56af1f0989ff0c6781005e97/feed)

Cinch Plugin to allow users to convert units.

## Installation

Add this line to your application's Gemfile:

    gem 'cinch-convert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-convert

## Usage

Just add the plugin to your list:

    @bot = Cinch::Bot.new do
      configure do |c|
        c.plugins.plugins = [Cinch::Plugins::Convert]
      end
    end

You will also need to have GNU Units installed. The Units binary that
ships with OSX is old and doesn't work. If you have units installed
some place that's not '/usr/bin/units' you will have to specify the
alternate location.

    c.plugins.options[Cinch::Plugins::Convert][:units_path] = '/usr/bin/gunits'

Once that's all done, just use `!convert x unit1 to unit2` in the channel.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
