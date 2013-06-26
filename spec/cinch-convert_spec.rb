require 'spec_helper'

describe Cinch::Plugins::Convert do

  include Cinch::Test

  before(:each) do
    @bot = make_bot(Cinch::Plugins::Convert)
  end

end
