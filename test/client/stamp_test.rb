$:.unshift File.dirname(__FILE__) + '/../' # allows command line to execute tests
require 'helper'

class StampTest < Test::Unit::TestCase

  context '.create' do
    setup {stub_post('AuthenticateUser') }

    context 'with valid data' do
      setup do
        stub_post('CreateIndicium')
        @stamp = Stamps.create!(
          :transaction_id  => "1234567890ABCDEFG",
          :rate          => {
            :add_ons       => {
              :add_on => [
                { :type => 'US-A-COD' },
                { :amount  => '0.19', :type => 'US-A-DC' }
              ]
            }
          },
          :to => {:full_name => 'Matt Sears'},
          :customs => {
            :customs_lines => [
              :custom => {
                :description => 'Tee Shirt',
                :quantity    => 1,
                :weight_oz   => '7.8',
                :value       => 18.00
              }
            ]
          })
      end

      should 'return the url for the stamp' do
        assert @stamp[:url]
      end

      should 'return the postage balance' do
        assert_equal '5.8600', @stamp[:postage_balance][:available_postage]
        assert_equal '10.00',  @stamp[:postage_balance][:control_total]
      end

    end
  end

  context '.cancel' do
    setup {stub_post('AuthenticateUser') }

    context 'with valid data' do
      setup do
        stub_post('CancelIndicium')
        @cancel = Stamps.cancel!
      end

      should 'return just the authenticator' do
        assert @cancel[:authenticator]
      end

    end
  end

  context '.track' do
    setup {stub_post('AuthenticateUser') }

    context 'with valid data' do

      setup do
        stub_post('TrackShipment')
        @track = Stamps.track('342343243243')
      end

      should 'return an list of tracking events' do
        assert_equal 3,  @track[:tracking_events][:tracking_event].size
      end

      should 'map individual tracking event properties' do
        tracking_event = @track[:tracking_events][:tracking_event].first
        assert_equal 'DELIVERED', tracking_event[:event]
        assert_equal 'FORT WAYNE', tracking_event[:city]
        assert_equal 'IN', tracking_event[:state]
        assert_equal '46809', tracking_event[:zip]
        assert_equal 'US', tracking_event[:country]
      end

    end

  end
end
