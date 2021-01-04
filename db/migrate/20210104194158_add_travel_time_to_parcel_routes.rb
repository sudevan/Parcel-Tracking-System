class AddTravelTimeToParcelRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :parcel_routes, :travel_time, :integer
  end
end
