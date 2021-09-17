class CreateUserProductPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :user_product_purchases do |t|
      t.references :product
      t.references :user
      t.boolean :payment_status, default: false
      t.timestamps
    end
  end
end
