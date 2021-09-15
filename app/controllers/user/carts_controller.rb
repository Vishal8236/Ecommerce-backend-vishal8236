class User:: CartsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include ApplicationHelper
    
    def index
        @get_cart_products_id = UserCart.all

        @products = [];
        # byebug
        @get_cart_products_id.each do |item| 
            @products.append(Product.find(item.product_id))
        end

        render json:{products: @products, cart_product_id: @get_cart_products_id}
    end
    
    def create
        token_authentication(params[:headers][:Authenticate])
        if current_user
            @cart = UserCart.new(user_id: current_user.id, product_id: getProductId)
            if @cart.save
                render json: {msg: "product successfully added in cart"}
            else
                render json: {error: "product can't added in cart"}
            end
        end
    end
    
    def destroy
        if UserCart.delete(params[:id])
            @get_cart_products_id = UserCart.all

            @products = [];
            # byebug
            @get_cart_products_id.each do |item| 
                @products.append(Product.find(item.product_id))
            end

            render json:{products: @products, cart_product_id: @get_cart_products_id}
        end
    end
    
    private

    def getProductId
        params[:id]
    end
    
end