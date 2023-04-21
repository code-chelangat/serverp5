class JsonWebToken
    # Encodes and signs JWT Payload with expiration
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  
    # Decodes the JWT with the signed secret
    def self.decode(token)
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new payload
    rescue
      nil
    end
  end