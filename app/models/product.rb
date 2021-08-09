class Product < ApplicationRecord
    belongs_to :shop_info
    belongs_to :user
end
