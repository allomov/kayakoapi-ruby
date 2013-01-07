require "kayakoapi-ruby/version"

module Kayakoapi
  # Required Libraries
  require 'openssl'
  require 'base64'
  require 'uri'

  class APISig
    def initialize(key, secret)
      @api_key = key
      @secret_key = secret
    end

    def get_salt()
      @last_salt = rand(10000000000).to_s
    end

    def hash(key, salt)
      OpenSSL::HMAC.digest('sha256', key, salt)
    end

    def b64encode(hash)
      signature = Base64.encode64(hash);
    end

    def new_signature()
      self.get_salt
      hash = self.hash(@secret_key, @last_salt)
      b64hash = self.b64encode hash
      @last_hash = URLGenerator::urlncode b64hash.strip
      return { signature: @last_hash, salt: @last_salt, apikey: @api_key }
    end
  end

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
      @params.each do |key, value|
        current_url += "&#{key}=#{value}"
      end
      return current_url
    end

    def first_param?
      @first_param
    end

    def self.urlncode(string)
      URI.escape(string, Regexp.new("[Generating an API Signature^#{URI::PATTERN::UNRESERVED}]"))
    end
  end

  class App
    def initialize(base_url)
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
