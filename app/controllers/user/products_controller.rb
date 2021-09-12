class User::ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @all_product = Product.all;
        render json:{products: @all_product}
    end
    
end
