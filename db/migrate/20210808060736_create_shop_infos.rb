class CreateShopInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_infos do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :service
      t.references :user
      t.timestamps
    end
  end
end
