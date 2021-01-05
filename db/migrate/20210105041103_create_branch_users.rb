class CreateBranchUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :branch_users do |t|
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
