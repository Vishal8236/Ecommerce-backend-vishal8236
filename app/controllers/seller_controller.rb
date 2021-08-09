class SellerController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @all_shops = ShopInfo.where(user_id: params[:user_id])
        render json:{ shops: @all_shops }
    end
   
    def seller_products
        @product = Product.where(shop_info_id: params[:shop_id])
        render json:{ product: @product }
    end
    
end
