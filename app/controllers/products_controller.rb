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
            product_image_json = hash_data['product_image'].to_json
            Product.create(
                product_name: hash_data["product_name"],
                brand_name: hash_data["product_brand_name"],
                price: hash_data["product_price"],
                product_image: product_image_json,
                description: hash_data["product_description"],
                avaliable: hash_data["product_stock"],
                shop_info_id: find_shop(params[:shop_id]),
                user_id: current_user.id,
            )
            render json:{msg: "store successfully"}
        end
    end
    
    def show
        shop_id = find_shop(params[:shop_id])
        product_details = Product.find(params[:id])
        render json:{product_desc: product_details}
    end
    
    private

    def find_shop(shop_name)
        shop = ShopInfo.find_by(name: shop_name)
        return shop.id
    end
    
end
