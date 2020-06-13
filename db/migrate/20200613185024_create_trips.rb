class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips, id: :uuid do |t|
      t.string :origin, null: false
      t.string :destination, null: false
      t.string :origin_geocode, array: true, null: false
      t.string :destination_geocode, array: true, null: false
      t.references :driver, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
