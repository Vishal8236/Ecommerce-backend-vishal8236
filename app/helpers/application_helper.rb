module ApplicationHelper
    def token_authentication(token)
        begin
            user = User.find(decode(token)["user_id"])
			session[:current_user] = user
            render :json => {user: user}
        rescue => exception
            render json:{error: "User not found"}	
        end
    end
end
