class AddPickupScheduleToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :pickup_schedulle, :DateTime
    add_column :consignments, :delivery_schedulle, :DateTime
  end
end
