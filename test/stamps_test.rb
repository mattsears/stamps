$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class StampsTest < Test::Unit::TestCase

  context "when delegating to a client" do

    setup do
      stub_post("AuthenticateUser")
      @client = Stamps::Client.new
    end

    should 'respond to client methods' do
      Stamps.respond_to?(:cleanse_address)
      Stamps.respond_to?(:account)
    end

    should 'have a default configuration settings' do
      assert @client.endpoint
      assert @client.integration_id
      assert @client.username
      assert @client.password
    end
  end

end
