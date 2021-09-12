module ShopHelper
    
    def getShopIdByName(shop_name)
        shop = ShopInfo.find_by(name: shop_name)
        return shop.id
    end
    
end
