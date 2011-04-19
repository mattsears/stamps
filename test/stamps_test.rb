require 'helper'

class StampsTest < Test::Unit::TestCase

  context "when delegating to a client" do
    setup do
      stub_post("AuthenticateUser")
      @client = Stamps::Client.new
    end

    should 'have a default configuration settings' do
      assert @client.endpoint
      assert @client.integration_id
      assert @client.username
      assert @client.password
    end
  end
end
