module Kayakoapi
  require 'openssl'
  require 'base64'

  class APISig
    def initialize(key, secret)
      @api_key = key
      @secret_key = secret
    end

    def get_salt()
      rand(10000000000).to_s
    end

    def hash(key, salt)
      OpenSSL::HMAC.digest('sha256', key, salt)
    end

    def b64encode(hash)
      signature = Base64.encode64(hash);
    end

    def new_signature()
      salt = self.get_salt
      hash = self.hash(@secret_key, salt)
      b64hash = self.b64encode hash
      return { signature: b64hash.strip, salt: salt, apikey: @api_key }
    end
  end
end