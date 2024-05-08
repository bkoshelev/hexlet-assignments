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
          keys << key
          values << value
        end
        puts keys.type?, values.type?
        [keys, values].to_h
    end

    def query_param(key, default_value = nil)
        query_params[key] =! default_value
    end
end
# END
