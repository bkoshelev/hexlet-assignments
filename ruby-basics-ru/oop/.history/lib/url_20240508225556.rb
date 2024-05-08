# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
    def initialize(address)
      @address = URI(address)
    end

end
# END
