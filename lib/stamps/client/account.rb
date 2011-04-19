module Stamps
  class Client
    module Account

      # Returns information about the stamps account
      #
      # @param params [Hash] authenticator, address, rates.
      # @return [Hash]
      #
      def account(params = {})
        params[:authenticator] = authenticator_token
        response = request('GetAccountInfo', Stamps::Mapping::Account.new(params) )
        response[:get_account_info_response][:account_info] if response
      end

      # Add funds to postage account
      #
      def purchase_postage(params = {})
        params[:authenticator] = authenticator_token
        response = request('PurchasePostage', Stamps::Mapping::PurchasePostage.new(params))
        response[:purchase_postage_response] if response
      end

      # Request carrier pickup
      # TODO: Should this go somewhere else?
      #
      def carrier_pickup(params = {})
        params[:authenticator] = authenticator_token
        response = request('CarrierPickup', Stamps::Mapping::CarrierPickup.new(params))
        response
      end

    end
  end
end

