# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    include Comparable

    def_delegators :@address, :scheme, :host, :port

    def <=>(other)
        newUrl = other.is_a?(String) ? Url.new(other) : other
        [@address.host, @address.scheme, @address.port, query_params] <=> [newUrl.host, newUrl.scheme, newUrl.port, newUrl.query_params]
      end

    def initialize(address)
      @address = URI(address)
    end

    def query_params
        return {} if @address.query == nil
        @address.query.split("&")
        .map do |str|
            key, value = str.split("=")
            [key.to_sym, value]
        end
        .to_h
    end

    def query_param(key, default_value = nil)
        query_params[key] ||= default_value
    end
end
# END
