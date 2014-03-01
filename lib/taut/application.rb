module Taut
  class Application < ::Sinatra::Base
    get "/?" do
      "Welcome to Taut"
    end
  end
end
