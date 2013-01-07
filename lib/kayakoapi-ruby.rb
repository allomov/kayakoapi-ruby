require "kayakoapi-ruby/version"
require "kayakoapi-ruby/apisig"
require "kayakoapi-ruby/urlgenerator"

module Kayakoapi
  require 'uri'

  class App
    def initialize(base_url, app_key, app_secret)
      @api_sig = APISig.new(app_key, app_secret)
      @url_builder = URLGenerator.new(base_url)
    end

    def run
      @api_sig.new_signature.each { |key, value| @url_builder.append_to_url(key, value) }
      begin
        puts "Generated URL: #{@url_builder.full_url}"
      rescue => e
        puts "URL Could not be generated, no parameters were appended to the URL."
      end
    end
  end
end
