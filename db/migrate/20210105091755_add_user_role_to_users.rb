class AddUserRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_roles, :string, :default => "guest"
  end
end
