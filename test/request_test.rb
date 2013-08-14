$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class RequestTest < Test::Unit::TestCase
	context "get_authenticator_token" do
		context "with invalid authentication token" do
      setup do
        @response = stub_response("failed_auth")
        stub_request(:post, "https://stamps.example.com/swsim/swsimv12.asmx").
        with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:tns=\"http://stamps.com/xml/namespace/2010/11/swsim/swsimv12\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><tns:AuthenticateUser><tns:Credentials><tns:IntegrationID>XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</tns:IntegrationID><tns:Username>USERNAME</tns:Username><tns:Password>PASSXXXX</tns:Password></tns:Credentials></tns:AuthenticateUser></soap:Body></soap:Envelope>",
        :headers => {'Accept'=>'*/*', 'Content-Type'=>'text/xml;charset=UTF-8', 'Soapaction'=>'http://stamps.com/xml/namespace/2010/11/swsim/swsimv12/AuthenticateUser', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      end

      should "raise an exception" do
      	assert_raises Stamps::InvalidIntegrationID do
          Stamps::API.new.get_authenticator_token
        end
      end
		end
	end
end