class AddCurrentLocationToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :current_location, :integer
    add_column :consignments, :next_location, :integer
  end
end
