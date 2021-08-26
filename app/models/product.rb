class Product < ApplicationRecord
    belongs_to :shop_info
    belongs_to :user

    validates :brand_name, presence: true
    validates :product_name, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :avaliable, presence: true
end
