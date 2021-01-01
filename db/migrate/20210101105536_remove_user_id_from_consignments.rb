class RemoveUserIdFromConsignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :consignments, :user_id, :integer
  end
end
