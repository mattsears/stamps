$:.unshift File.dirname(__FILE__) + '/../' # allows command line to execute tests
require 'helper'

class StampTest < Test::Unit::TestCase

  context ".create" do
    setup {stub_post("AuthenticateUser") }

    context "with valid data" do
      setup do
        stub_post("CreateIndicium")
        @stamp = Stamps.create!
      end
      should 'return the url for the stamp' do
        assert @stamp.url
      end
      should 'return the postage balance' do
        assert_equal "5.8600", @stamp.postage_balance.available_postage
        assert_equal "10.00",  @stamp.postage_balance.control_total
      end
    end

  end

  context '.cancel' do
    setup {stub_post("AuthenticateUser") }
    context "with valid data" do

    end
  end

end
