module Taut
  class Configuration
    def self.method_missing(m)
      ENV[m.to_s.upcase]
    end
  end
end
