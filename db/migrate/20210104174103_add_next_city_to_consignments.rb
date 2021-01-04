class AddNextCityToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :next_city, :string
  end
end
