# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    if env['PATH_INFO'] == '/about'
      [200, { 'Content-Type' => 'text/plain' }, ["About page"]]
    elsif env['PATH_INFO'] == '/'
      [200, { 'Content-Type' => 'text/plain' }, ["Hello, World!"]]
    else
      [404, { 'Content-Type' => 'text/plain' }, ["404 Not Found"]]
    end
    # END
  end
end
