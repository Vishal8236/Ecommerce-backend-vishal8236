class AddVerifyColumnInShopInfoTable < ActiveRecord::Migration[6.1]
  def change
    add_column :shop_infos, :shop_verify, :boolean, :default => false
    add_index :shop_infos, :service
  end
end
