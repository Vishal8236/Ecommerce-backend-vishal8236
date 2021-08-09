class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :brand_name
      t.string :price
      t.string :description
      t.string :product_image

      #reference with shop_id and user_id
      t.references :shop_info     
      t.references :user      
      t.timestamps
    end
  end
end
