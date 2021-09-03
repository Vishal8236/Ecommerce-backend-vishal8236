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
   
    def create_shop
        @shop = ShopInfo.new(name: params[:shop_infos][:shop_name], user_id: params[:shop_infos][:user_id])
        @all_shops = ShopInfo.where(user_id: params[:shop_infos][:user_id])
        if @shop.save
            render :json => {message: "Shop created succesfully.", shops: @all_shops}
        else
            render json:{message: "Shop not created succesfully."}
        end
    end
    
    def delete_shop
        @shops = ShopInfo.find_by(name: params[:name]).delete
        @all_shops = ShopInfo.where(user_id: 2)
        render :json => {msg: "Shop deleted succesfully.", shops: @all_shops}
    end
end

