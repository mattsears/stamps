module Stamps
  class Client

    # Produces a list of rates for all available USPS services based
    # on the ZIP Code or the foreign country being shipped to for
    # a given package weight and size.
    #
    # == Examples:
    #
    #  Stamps.get_rates(
    #    :from_zip_code => '45440',
    #    :to_zip_code   => '45458',
    #    :weight_oz     => '8.0',
    #    :ship_date     => '2011-06-01'
    #   )
    #
    module Rate

      # Produces a list of rates matching the criteria provided in
      # the parameters
      #
      def get_rates(params = {})
        rates = Stamps::Mapping::Rates.new({
          :authenticator => authenticator_token,
          :rate          => Stamps::Mapping::Rate.new(params)
        })
        response = request('GetRates', rates)
        if response[:envelope][:body][:get_rates_response].nil?
          response[:envelope][:body]
        else
          response[:envelope][:body][:get_rates_response][:rates].nil? ? [] : [response[:envelope][:body][:get_rates_response][:rates][:rate]].flatten
        end
      end

      def get_rate(params = {})
        rates  = get_rates(params)
        rates.is_a?(Array) ? rates.first : rates
      end

    end
  end
end

