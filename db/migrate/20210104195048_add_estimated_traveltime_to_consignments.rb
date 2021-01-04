class AddEstimatedTraveltimeToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :estimated_time, :integer
  end
end
