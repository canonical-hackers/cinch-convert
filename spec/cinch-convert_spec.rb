require 'spec_helper'

describe Cinch::Plugins::Convert do

  include Cinch::Test

  before(:each) do
    @bot = make_bot(Cinch::Plugins::Convert)
  end

  describe 'configuration' do
    it 'should handle the units binary\'s absence with grace' do
      @bot = make_bot(Cinch::Plugins::Convert, { :units_path => '/usr/baddir/units' })
      msg = make_message(@bot, '!convert 3 foo to bar')
      get_replies(msg).last.text.
        should == 'test: Sorry, there\'s a configuration issue.'
    end
  end

  describe 'conversions' do
    it 'should alow users to convert units' do
      msg = make_message(@bot, '!convert 2 inches to feet')
      get_replies(msg).last.text.
        should == 'test: 2 inches is 0.16666667 feet.'
    end

    it 'should allow users to convert temps' do
      msg = make_message(@bot, '!convert tempF(32) to tempC')
      get_replies(msg).last.text.
        should == 'test: tempF(32) is 0 tempC.'
    end

    it 'should return an error on conformability issues' do
      msg = make_message(@bot, '!convert 15 minutes to gallons')
      get_replies(msg).last.text.
        should == 'test: Sorry, there was an error when making that conversion.'
    end

    it 'should return an error on invalid units' do
      msg = make_message(@bot, '!convert 15 foo to bar')
      get_replies(msg).last.text.
        should == 'test: Sorry, unknown unit \'foo\'.'
    end

    it 'shouldn\'t return anything on invalid conversions' do
      msg = make_message(@bot, '!convert foo 15 foo baz bar')
      get_replies(msg).
        should be_empty
    end
  end
end
