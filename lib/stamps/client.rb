module Stamps
  # Wrapper for the Stamps Web Services API
  #
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    include Stamps::Mapping
    include Stamps::Client::Account
    include Stamps::Client::Address
    include Stamps::Client::Rate
    include Stamps::Client::Stamp
  end
end
