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
      
      # check the payment of purchase_pastage 
      #
      def get_purchase_status(params = {})
        params[:authenticator] = authenticator_token
        response = request('GetPurchaseStatuee', Stamps::Mapping::GetPurchaseStatus.new(params))
        response[:errors].empty? ? response[:purchase_postage_response] : response
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

