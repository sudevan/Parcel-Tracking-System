class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.integer :s_pin
      t.integer :d_pin
      t.integer :travel_time

      t.timestamps
    end
  end
end
