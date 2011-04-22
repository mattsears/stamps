$:.unshift File.dirname(__FILE__) + '/../' # allows command line to execute tests
require 'helper'

class StampsTest < Test::Unit::TestCase
  context "Stamp::Client:Rate" do
    setup do
      stub_post("AuthenticateUser")
    end

    context ".get_rates" do

      setup do
        stub_post("GetRates")
        @rates = Stamps.get_rates
      end

      should 'return an array of rates' do
        assert_equal Array, @rates.class
      end

      should 'assign the amount for a given rate' do
        assert_equal "2.41", @rates.first.amount
      end

    end

    context '.get_rates with package and service types' do

      setup do
        stub_post("GetRate", 'GetRates')
        @rate = Stamps.get_rate
      end

      should 'return an Hashie::Mash for the single rate' do
        assert_equal Hashie::Mash, @rate.class
      end

    end
  end
end
