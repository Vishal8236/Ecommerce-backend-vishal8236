class ApplicationController < ActionController::Base
    def secret_key
		"myNameIsVishalPatidar"
	end
	
	def encode(payload)
		JWT.encode(payload, secret_key, "HS256")
	end
	
	def decode(token)
		JWT.decode(token, "myNameIsVishalPatidar", true, {algorithm: "HS256"})[0]
	end
end
