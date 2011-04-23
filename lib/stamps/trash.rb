require 'hashie/trash'

module Hashie
  class Trash

    class << self
      attr_reader :properties
    end

    # Use a n Array instead of a set since order is important
    # TODO:  Look at https://github.com/ahoward/map
    instance_variable_set('@properties', Array.new)


    # Sort the hash by the order in which the properties are declared
    def to_hash
      sorted_keys = self.class.properties.map{|prop| prop.to_s} & self.keys

      # Use active_support for ordering hashes for Ruby < 1.9
      out = RUBY_VERSION >= '1.9' ? {} : ActiveSupport::OrderedHash.new
      sorted_keys.each do |k|
        next if self[k].nil?
        out[k] = Hashie::Hash === self[k] ? self[k].to_hash : self[k]
      end
      out
    end

  end
end
