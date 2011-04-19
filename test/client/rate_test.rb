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
        @rates = Stamps.get_rates(
          :from_zip_code => '45440',
          :to_zip_code   => '45458',
          :weight_lb     => '0.5',
          :ship_date     => '2011-06-01'
        )
      end

      should 'return an array of rates' do
        assert_equal Array, @rates.class
      end
      should 'assign the amount for a given rate' do
        assert_equal "2.41", @rates.first.amount
      end

    end
  end
end
