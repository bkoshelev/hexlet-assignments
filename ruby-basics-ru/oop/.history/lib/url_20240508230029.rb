# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    def initialize(address)
      @address = URI(address)
    end
    extend Forwardable
    def_delegator :scheme, :host

end
# END
