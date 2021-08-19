class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include ApplicationHelper
    # before_action :find_shop

    def index
        @all_products = Product.where(shop_info_id: find_shop(params[:shop_id]))
        render json:{ products: @all_products }
    end

    def create
        token_authentication(params[:headers][:Authenticate])
        if current_user
            hash_data = JSON.parse params[:data][:product_data]

            Product.create(
                product_name: hash_data["product_name"],
                brand_name: hash_data["product_brand_name"],
                price: hash_data["product_price"],
                product_image: hash_data["product_image"],
                description: hash_data["product_description"],
                shop_info_id: find_shop(params[:shop_id]),
                user_id: current_user.id,
            )
            render json:{msg: "store successfully"}
        end
    end
    
    private

    def find_shop(shop_name)
        shop = ShopInfo.find_by(name: shop_name)
        return shop.id
    end
    
end
