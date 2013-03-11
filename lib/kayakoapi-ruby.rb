require "kayakoapi-ruby/version"
require "kayakoapi-ruby/apisig"
require "kayakoapi-ruby/urlgenerator"

require 'uri'

class KayakoApi
  def initialize(base_url, app_key, app_secret)
    @api_sig     = Kayakoapi::APISig.new(app_key, app_secret)
    @url_builder = Kayakoapi::URLGenerator.new(base_url)
  end

  def url
    @api_sig.new_signature.each { |key, value| @url_builder.append_to_url(key, value) }
    begin
      @url_builder.full_url
    rescue => e
      false
    end
  end

  def signature
    @api_sig.new_signature
  end
end

