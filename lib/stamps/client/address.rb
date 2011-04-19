module Stamps
  class Client
    module Address

      # Authorizes the User and returns authenticator token
      #
      def clean_address(params = {})
        params[:authenticator] = authenticator_token
        response = request('CleanseAddress ', Stamps::Mapping::CleanseAddress.new(params))
        if response.errors.empty?
          return response[:cleanse_address_response]
        end
        response
      end

    end
  end
end

