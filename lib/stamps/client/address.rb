module Stamps
  class Client
    module Address

      # Authorizes the User and returns authenticator token
      #
      def clean_address(params = {})
        params[:authenticator] = authenticator_token
        response = request('CleanseAddress', Stamps::Mapping::CleanseAddress.new(params))
        #response[:errors].empty? ? response[:cleanse_address_response] : response
        response[:errors].empty? ? response[:envelope][:body][:cleanse_address_response] : response[:envelope][:body]
      end

    end
  end
end

