module Stamps
  class Client
    module Rate

      def get_rates(params = {})
        rates = Stamps::Mapping::Rates.new({
          :authenticator => authenticator_token,
          :rate          => Stamps::Mapping::Rate.new(params)
        })
        response = request('GetRates', rates)
        if response.valid?
          return [response[:get_rates_response][:rates][:rate]].flatten
        end
        response
      end

      def get_rate(params = {})
        rates  = get_rates(params)
        return rates.first if rates.is_a?(Array)
        rates
      end

    end
  end
end

