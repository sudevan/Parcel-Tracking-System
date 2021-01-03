class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.string "trackid"
      t.string "event"
      t.string "user"
      t.timestamps
    end
  end
end
