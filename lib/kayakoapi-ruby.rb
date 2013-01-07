require "kayakoapi-ruby/version"
require "kayakoapi-ruby/apisig"
require "kayakoapi-ruby/urlgenerator"

module Kayakoapi
  require 'uri'

  class App
    def initialize(base_url)
      begin
        URI.parse(base_url)
      rescue
        puts "Invalid URL provided."
        exit
      end
      @api_sig = APISig.new
      @url_builder = URLGenerator.new(base_url)
    end

    def run
      self.get_new_sig.each { |key, value| @url_builder.append_to_url(key, value) }
      puts "Generated URL: #{@url_builder.full_url}"
    end

    def get_new_sig
      @api_sig.new_signature
    end
  end
end
