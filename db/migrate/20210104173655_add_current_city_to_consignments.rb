class AddCurrentCityToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :current_city, :string
  end
end
