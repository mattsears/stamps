$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class TypesTest < Test::Unit::TestCase

  context "types" do

    should 'return a hash of service type' do
      assert_equal Hash, Stamps::Types::SERVICE.class
    end

    should 'return a hash of add ons' do
      assert_equal Hash, Stamps::Types::ADD_ONS.class
    end

    should 'return a hash of carrier pickup locations' do
      assert_equal Hash, Stamps::Types::CARRIER_PICKUP_LOCATION.class
    end

    should 'return an array of package types' do
      assert_equal Array, Stamps::Types::PACKAGE.class
    end
  end

end
