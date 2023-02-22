class JsonWebToken
    SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

    # encode payload and valid for 24 hours
    def self.encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    # decode token to get payload
    # enabled to handle by Symbol or String
    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY).first
        HashWithIndifferentAccess.new.decoded
    end
end
