module ApplicationHelper
    def token_authentication(token)
        begin
            user = User.find(decode(token)["user_id"])
			session[:current_user] = user
            return user
        rescue => exception
            return "User not found"	
        end
    end
end
