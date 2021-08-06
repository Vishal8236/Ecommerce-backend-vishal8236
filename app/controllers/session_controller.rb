class SessionController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        byebug
    end

    def login
        byebug
        user = User.find_by(email: params[:user][:username])

        if user 
            payload = {user_id: user.id}
            token = encode(payload)
            render :json => {user: user, token: token}
        else
            render json:{error: "User not found"}	
        end	
    end

    def token_authentication
        token = request.headers["Authenticate"]
        begin
            user = User.find(decode(token)["user_id"])
            render :json => {user: user}
        rescue => exception
            render json:{error: "User not found"}	
        end
    end
end
