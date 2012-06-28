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
        assert_equal '2.41', @rates.first[:amount]
      end

      should 'return the ship date' do
        assert_equal '2011-04-01', @rates.first[:ship_date]
      end

    end

    context '.get_rates with package and service types' do
      setup do
        stub_post("GetRate", 'GetRates')
        @rate = Stamps.get_rate
      end

      should 'return an hash for the single rate' do
        assert_equal Hash, @rate.class
      end

      should 'return an array of addons' do
        assert_equal Hash, @rate[:add_ons].class
      end
    end
  end
end
