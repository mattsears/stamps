require 'stamps/errors'
require 'stamps/trash'
require 'stamps/configuration'
require 'stamps/api'
require 'stamps/mapping'
require 'stamps/types'
require 'stamps/client'

module Stamps
  extend Configuration

  API_VERSION = '1_0' # Stamps API version

  # Alias for Stamps::Client.new
  #
  # @return [Stamps::Client]
  #
  def self.client(options={})
    Stamps::Client.new(options)
  end

  # Delegate to Stamps::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Stamps::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end

end
