class AddPhoneRoleColumnInUserTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string
    add_column :users, :phone, :string, :limit => 10
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
