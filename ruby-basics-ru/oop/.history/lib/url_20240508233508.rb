# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    def_delegators :@address, :scheme, :host, :port

    def initialize(address)
      @address = URI(address)
    end

    def query_params
        keys = []
        values = []
        @address.query.split("&")
        .each do |str|
          puts str
          key, value = str.split("=")
          puts key, value
          keys << key.to_sym
          values << value
        end
        p keys, values
        result = [keys ,values]
        p result.length
        result.to_h
    end

    def query_param(key, default_value = nil)
        query_params[key] =! default_value
    end
end
# END
