$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class ResponseTest < Test::Unit::TestCase

  context "with valid response" do
    setup do
      @response = stub_response("GetRates")
    end

    should 'be valid' do
      assert @response.valid?
    end

    should 'have no errors' do
      assert @response.errors.empty?
    end
  end

  context 'with non-success responses' do

    should 'raise BadRequest' do
      assert_raise(Stamps::BadRequest) { stub_response('GetRates', 400)}
    end

    should 'raise Unauthorized' do
      assert_raise(Stamps::Unauthorized) { stub_response('GetRates', 401)}
    end

    should 'raise Forbidden' do
      assert_raise(Stamps::Forbidden) { stub_response('GetRates', 403)}
    end

    should 'raise NotFound' do
      assert_raise(Stamps::NotFound) { stub_response('GetRates', 404)}
    end

    should 'raise NotAcceptable' do
      assert_raise(Stamps::NotAcceptable) { stub_response('GetRates', 406)}
    end

    should 'raise InternalServerError' do
      assert_raise(Stamps::InternalServerError) { stub_response('GetRates', 500)}
    end

    should 'raise ServiceUnavailable' do
      assert_raise(Stamps::ServiceUnavailable) { stub_response('GetRates', 502) }
    end

  end

  context "with invalid soap response" do
    setup do
      @response = stub_response("InvalidSoap")
    end

    should 'return not valid' do
      assert_equal false, @response.valid?
    end

    should 'contain error messages' do
      assert @response.errors.any?
    end
  end

end
