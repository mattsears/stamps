module Stamps

  # = Stamps::Response
  #
  # Represents the response and contains the HTTP response.
  #
  class Response

    # Expects an <tt>Savon::SOAP::Response</tt> and handles errors.
    def initialize(response)
      self.errors = []
      self.valid = true
      self.savon  = response
      self.http   = response.http
      self.hash   = self.savon.to_hash
      raise_errors
    end

    attr_accessor :savon, :http, :errors, :valid, :hash, :code

    # Returns the SOAP response body as a Hash.
    def to_hash
      self.hash.merge!(:errors => self.errors)
      self.hash.merge!(:valid? => self.valid)
      self.hash
      Stamps.format.to_s.downcase == 'hashie' ? Hashie::Mash.new(@hash) : self.hash
    end

    # Um, there's gotta be a better way
    def valid?
      self.valid
    end

    # Process any errors we get back from the service.
    # Wrap any internal errors (from Soap Faults) into an array
    # so that clients can process the error messages as they wish
    #
    def raise_errors
      message =  'FIXME:  Need to parse http for response message'
      return  self.format_soap_faults if savon.soap_fault.present?

      case http.code.to_i
      when 200
        return
      when 400
        raise BadRequest, "(#{http.code}): #{message}"
      when 401
        raise Unauthorized, "(#{http.code}): #{message}"
      when 403
        raise Forbidden, "(#{http.code}): #{message}"
      when 404
        raise NotFound, "(#{http.code}): #{message}"
      when 406
        raise NotAcceptable, "(#{http.code}): #{message}"
      when 500
        raise InternalServerError, "Stamps.com had an internal error. (#{http.code}): #{message}"
      when 502..503
        raise ServiceUnavailable, "(#{http.code}): #{message}"
      end
    end

    # Include any errors in the response
    #
    def format_soap_faults
      fault = self.hash.delete(:fault)
      self.errors << fault[:faultstring]
      self.valid = false
    end

  end
end
