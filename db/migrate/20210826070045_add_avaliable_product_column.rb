class AddAvaliableProductColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :avaliable, :string
    add_index :products, :brand_name
    #Ex:- add_index("admin_users", "username")
  end
end
