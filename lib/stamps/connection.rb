require 'savon'

module Stamps
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :url => endpoint,
        :ssl => { :verify => false }
      }
      Savon::Client.new do |wsdl, http|
        wsdl.endpoint = self.endpoint
        wsdl.namespace = self.namespace
      end
    end
  end
end
