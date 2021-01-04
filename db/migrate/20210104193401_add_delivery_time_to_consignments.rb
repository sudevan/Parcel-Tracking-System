class AddDeliveryTimeToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :delivery_time, :integer
    add_column :consignments, :pickup_time, :integer
  end
end
