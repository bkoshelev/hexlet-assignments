# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
          status, headers, body = @app.call(env)
          body_hash = Digest::SHA2.new(256).hexdigest body.first
          new_body = [body.first, body_hash]
          [status, headers, new_body]
    # END
  end
end
