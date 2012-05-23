module Stamps
  # Defines constants and methods related to configuration
  module Configuration

    # An array of valid keys in the options hash when configuring a {Stamps::API}
    VALID_OPTIONS_KEYS = [
      :integration_id,
      :username,
      :password,
      :namespace,
      :format,
      :return_address,
      :test_mode,
      :raise_errors,
      :log_messages,
      :endpoint].freeze

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'https://swsim.stamps.com/swsim/swsimv12.asmx'.freeze
    
    # The default namespace used on Stamps.com wsdl
    DEFAULT_NAMESPACE = 'http://stamps.com/xml/namespace/2010/11/swsim/swsimv12'

    # @note JSON is preferred over XML because it is more concise and faster to parse.
    DEFAULT_FORMAT = :hash

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Stamps Ruby Gem".freeze

    # Do not raise errors by default
    DEFAULT_RAISE_ERRORS = false

    # Do not log requests and response by default
    DEFAULT_LOG_MESSAGES = false

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self

      HTTPI.log = false
      Savon.configure do |config|
        config.log = self.log_messages
        config.raise_errors = self.raise_errors
      end
    end

    # Create a hash of options and their values
    def options
      Hash[VALID_OPTIONS_KEYS.map {|key| [key, send(key)] }]
    end

    # Reset all configuration options to defaults
    def reset
      self.endpoint     = DEFAULT_ENDPOINT
      self.namespace    = DEFAULT_NAMESPACE
      self.format       = DEFAULT_FORMAT
      self.log_messages = DEFAULT_LOG_MESSAGES
      self.raise_errors = DEFAULT_RAISE_ERRORS
    end
  end
end
