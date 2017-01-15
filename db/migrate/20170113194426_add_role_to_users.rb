class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer  # To the 'users' table add a 'role' column of the 'integer' type
  end
end
