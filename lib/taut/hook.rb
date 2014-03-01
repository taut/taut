module Taut
  class Hook < Sinatra::Base

    def self.register_hook(klass)
      Taut::Application.use Object.const_get(klass)
    end

    protected

    def config
      Taut::Configuration
    end
  end
end
