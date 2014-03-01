module Taut
  class Hook < Sinatra::Base

    protected

    def config
      Taut::Configuration
    end
  end
end
