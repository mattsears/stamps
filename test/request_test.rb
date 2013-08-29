$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class RequestTest < Test::Unit::TestCase
	context "get_authenticator_token" do
		context "with invalid authentication token" do
      setup do
        stub_post("failed_auth", "AuthenticateUser")
      end

      should "raise an exception" do
      	assert_raises Stamps::InvalidIntegrationID do
          Stamps::API.new.get_authenticator_token
        end
      end
		end
	end
end