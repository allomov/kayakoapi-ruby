module Kayakoapi
  class NoURLParameters < Exception
    def initialize(data)
      @data = data
    end
  end
end