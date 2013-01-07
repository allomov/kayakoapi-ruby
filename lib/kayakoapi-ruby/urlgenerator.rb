module Kayakoapi
  require 'uri'

  class URLGenerator
    def initialize(url_root)
      @url_root = url_root
      @params = {}
    end

    def append_to_url(key, value)
      @params[key] = value
    end

    def full_url
      current_url = @url_root
      if @params.empty?
        raise NoURLParametersException.new(msg: "Params hash is empty while attempting to build a URL.")
      else
        @params.each do |key, value|
          current_url += "&#{key}=#{value}"
        end
        return current_url
      end
    end

    def first_param?
      @first_param
    end

    def self.urlncode(string)
      URI.escape(string, Regexp.new("[Generating an API Signature^#{URI::PATTERN::UNRESERVED}]"))
    end
  end
end