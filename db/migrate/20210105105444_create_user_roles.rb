class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
