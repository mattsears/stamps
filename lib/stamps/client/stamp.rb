module Stamps
  class Client

    # == Stamp Module
    #
    # Stamp provides an interface to creating and cancelling postage labels
    #
    #
    module Stamp

      # Creates postage labels.
      #
      # In order to successfully create postage labels, the following steps
      # must happen:
      #
      # 1. Authentication -  identify the user and ensure that the user is
      #    authorized to perform the operation.
      #
      # 2. CleanseAddress - Ship-to addresses must be standardized based on
      #    USPS rules for proper address conventions before a shipping label
      #    can be issued.
      #
      # 3. GetRates - A call to GetRates will allow users to view and select
      #    the best shipping service for their needs.
      #
      # @param params [Hash] authenticator, address, rates.
      # @return [Hash]
      #
      def create!(params = {})
        params[:authenticator] = authenticator_token unless params[:authenticator]
        params[:from] ||= {}
        #params[:rate].delete(:add_ons)
        #params[:rate][:cubic_pricing] = true
        params[:rate].delete(:delivery_date)
        stamp = Stamps::Mapping::Stamp.new(params)
        response = request('CreateIndicium', stamp)
        response[:errors].empty? ? response[:envelope][:body][:create_indicium_response] : response[:envelope][:body]
      end

      # Refunds postage and voids the shipping label
      #
      # @param [Hash] authenticator
      #
      def cancel!(params = {})
        params[:authenticator] = authenticator_token unless params[:authenticator]
        response = request('CancelIndicium', Stamps::Mapping::CancelStamp.new(params))
        response[:errors].empty? ? response[:envelope][:body][:cancel_indicium_response] : response[:envelope][:body]
      end

      # Returns an array of tracking events
      #
      # @param [String] the transaction id of the stamp
      #
      def track(stamps_transaction_id)
        params = {
          :authenticator => authenticator_token,
          :stamps_transaction_id => stamps_transaction_id
        }
        response = request('TrackShipment', Stamps::Mapping::TrackShipment.new(params))
        response[:errors].empty? ? response[:envelope][:body][:track_shipment_response] : response[:envelope][:body]
      end

    end
  end
end

