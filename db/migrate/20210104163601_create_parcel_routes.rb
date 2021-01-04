class CreateParcelRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :parcel_routes do |t|
      t.integer :route_id
      t.string :city_1
      t.string :city_2

      t.timestamps
    end
  end
end
