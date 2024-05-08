# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    def_delegator :@address, :scheme, :scheme
    def_delegator :@address, :host, :host

    def initialize(address)
      @address = URI(address)
    end

end
# END
