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
        response[:errors].empty? ? response[:get_account_info_response][:account_info] : response
      end

      # Add funds to postage account
      #
      def purchase_postage(params = {})
        params[:authenticator] = authenticator_token
        response = request('PurchasePostage', Stamps::Mapping::PurchasePostage.new(params))
        response[:errors].empty? ? response[:purchase_postage_response] : response
      end
      
      # Check the payment of purchase_postage 
      #
      def get_purchase_status(params = {})
        params[:authenticator] = authenticator_token
        response = request('GetPurchaseStatus', Stamps::Mapping::GetPurchaseStatus.new(params))
        response[:errors].empty? ? response[:get_purchase_status_response] : response
      end

      # Request carrier pickup
      # TODO: Should this go somewhere else?
      #
      def carrier_pickup(params = {})
        params[:authenticator] = authenticator_token
        response = request('CarrierPickup', Stamps::Mapping::CarrierPickup.new(params))
        response[:errors].empty? ?  response[:carrier_pickup_response] : response
      end

    end
  end
end

