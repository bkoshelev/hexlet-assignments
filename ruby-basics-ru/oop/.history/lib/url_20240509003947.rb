# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    include Comparable

    def_delegators :@address, :scheme, :host, :port

    def <=>(other)
        p other.class
        newUrl = other.is_a String ? Url.new(other) : other
        [@address.host, @address.scheme, query_params] <=> [newUrl.host, newUrl.scheme, newUrl.query_params]
      end

    def initialize(address)
      p address
      @address = URI(address)
    end

    def query_params
        query_params_arr = @address.query ||= ''
        query_params_arr.split("&")
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
