class UpdateInUserTableRoleColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role
    add_reference :users, :work_roles, foreign_key: true
  end
end
