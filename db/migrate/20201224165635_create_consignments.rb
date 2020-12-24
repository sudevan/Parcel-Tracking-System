class CreateConsignments < ActiveRecord::Migration[6.0]
  def change
    create_table :consignments do |t|
      t.column "customer_id", :integer
      t.column "destination_pin", :integer
      t.column "source_pin", :integer
      t.column "status", :integer
      t.column "weight", :float
      t.column "tracking_id", :string 
      t.column "source_contact", :string
      t.column "destination_contact", :string
      t.timestamps
    end
  end
end
