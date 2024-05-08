# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    def_delegator :@address, :scheme, :scheme
    def_delegator :@address, :host, :host
    def_delegator :@address, :port, :port

    def initialize(address)
      @address = URI(address)
    end

    def query_params
        keys = []
        values = []
        @address.query.split("&")
        .map do |str|
          key, value = str.split("=")
          keys << key
          values << value
        end
        [keys, values].to_h
    end
end
# END
