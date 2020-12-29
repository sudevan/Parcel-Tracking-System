class CreateConsignments < ActiveRecord::Migration[6.0]
  def change
    create_table :consignments do |t|
      t.references :user
      t.integer :destination_pin
      t.integer :source_pin
      t.integer :status
      t.float :weight
      t.string :tracking_id
      t.string :source_contact
      t.string :destination_contact

      t.timestamps
    end
  end
end
