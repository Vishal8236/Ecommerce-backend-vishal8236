class ShopsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @all_shops = ShopInfo.where(user_id: params[:user_id])
        render json:{ shops: @all_shops }
    end

    def verify_shop
        byebug
    end
    
end
