module Kayakoapi
  class NoURLParametersException < Exception
    def initialize(data)
      @data = data
    end
  end
end