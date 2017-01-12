$:.unshift File.dirname(__FILE__) + '/../' # allows command line to execute tests
require 'helper'

class AccountTest < Test::Unit::TestCase

  context '#account' do
    setup { stub_post('AuthenticateUser') }

    context 'with valid data' do
      setup do
        stub_post('GetAccountInfo')
        @account = Stamps.account
      end

      should 'assign the user id' do
        assert_equal '1111111', @account[:user_id]
      end
    end
  end

  context '#purchase_postage' do
    setup { stub_post('AuthenticateUser') }

    context 'with valid data' do
      setup do
        stub_post('PurchasePostage')
        @purchase = Stamps.purchase_postage
      end

      should 'return reject reason' do
        assert_equal 'order being processed', @purchase[:rejection_reason]
      end

      should 'return postage balannce' do
        assert_equal '23.4300', @purchase[:postage_balance][:available_postage]
      end

    end
  end

  context '#carrier_pickup' do
    setup { stub_post('AuthenticateUser') }

    context 'with valid data' do

      setup do
        stub_post('CarrierPickup')
        @carrier_pickup = Stamps.carrier_pickup()
      end

      should 'return pickup date' do
        assert_equal '01/29/2011', @carrier_pickup[:pickup_date]
      end

      should 'return pickup day of the week' do
        assert_equal 'Saturday', @carrier_pickup[:pick_up_day_of_week]
      end

      should 'return a confirmation number' do
        assert_equal 'WTC7812296', @carrier_pickup[:confirmation_number]
      end
    end
  end
end
