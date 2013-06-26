# Cinch::Plugins::Convert

[![Gem Version](https://badge.fury.io/rb/cinch-convert.png)](http://badge.fury.io/rb/cinch-convert)
[![Dependency Status](https://gemnasium.com/canonical-hackers/cinch-convert.png)](https://gemnasium.com/canonical-hackers/cinch-convert)
[![Build Status](https://travis-ci.org/canonical-hackers/cinch-convert.png?branch=master)](https://travis-ci.org/canonical-hackers/cinch-convert)
[![Coverage Status](https://coveralls.io/repos/canonical-hackers/cinch-convert/badge.png?branch=master)](https://coveralls.io/r/canonical-hackers/cinch-convert?branch=master)
[![Code Climate](https://codeclimate.com/github/canonical-hackers/cinch-convert.png)](https://codeclimate.com/github/canonical-hackers/cinch-convert)

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

Once that's all done, just use `.convert x unit1 to unit2` in the channel.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
