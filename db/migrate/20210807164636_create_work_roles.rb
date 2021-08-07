class CreateWorkRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :work_roles do |t|
      t.string :role_name
      t.timestamps
    end
  end
end
