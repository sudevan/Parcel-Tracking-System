class AddRouteIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :route_id, :integer
  end
end
