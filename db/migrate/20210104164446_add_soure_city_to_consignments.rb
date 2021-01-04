class AddSoureCityToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :source_city, :string
    add_column :consignments, :destination_city, :string
  end
end
