class ShopsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include ApplicationHelper
    include ShopHelper

    def index
        @all_shops = ShopInfo.where(user_id: params[:user_id])
        render json:{ shops: @all_shops }
    end

    def verify_shop
        #verify user request
        token_authentication(params[:headers][:Authenticate])

        #convert json data in object
        hash_data = JSON.parse params[:data][:shop_data]

        #get shop id by name
        shop_id = getShopIdByName(params[:id])

        @shop = ShopInfo.find(shop_id);

        if @shop.update(phone: hash_data['phone'], address: hash_data['address'], service: hash_data['service'])
            if @shop.update(shop_verify: true)
                render json: {msg: "Now your shop verify successfully!"}
            end
        else
            render json: {error: "your shop not verify successfully!"}
        end
    end    
end
