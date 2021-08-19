class SessionController < ApplicationController
    skip_before_action :verify_authenticity_token

    def signup
        role_id = get_role_id(params[:user][:role])
        @user = User.new(name: params[:user][:name], email: params[:user][:email],password: params[:user][:password],phone: params[:user][:phone],work_roles_id: role_id)
        if @user.save
            payload = {user_id: @user.id}
            token = encode(payload)
            render :json => {user: @user, token: token}
        else
            render json:{error: "Some error while create user :( "}
        end
    end

    def login
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
    
    private

    def get_role_id(role_is)
        return 1 if role_is == "user"
        return 2 if role_is == "seller"
        return 3 if role_is == "distributor"
    end
    
end
