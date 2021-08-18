class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include ApplicationHelper
    
    def create
        byebug
        token_authentication(params[:headers][:Authenticate])
        puts session[:current_user]
    end
    
end
