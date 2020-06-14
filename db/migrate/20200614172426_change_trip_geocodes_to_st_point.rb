class Trip
end

class ChangeTripGeocodesToStPoint < ActiveRecord::Migration[6.0]
  def up
    add_column :trips, :origin_geocode_point, :st_point, geographic: true
    add_column :trips, :destination_geocode_point, :st_point, geographic: true
    add_index :trips, :origin_geocode_point, using: :gist
    add_index :trips, :destination_geocode_point, using: :gist
    change_column_null :trips, :origin_geocode, true
    change_column_null :trips, :destination_geocode, true
    Trip.find_each do |trip|
      trip.origin_geocode_point      = "POINT(#{trip.origin_geocode.last} #{trip.origin_geocode.first})"
      trip.destination_geocode_point = "POINT(#{trip.destination_geocode.last} #{trip.destination_geocode.first})"
      trip.save!
    end
  end

  def down
    remove_index :trips, :origin_geocode_point
    remove_index :trips, :destination_geocode_point
    remove_column :trips, :origin_geocode_point
    remove_column :trips, :origin_geocode_point
    change_column_null :trips, :origin_geocode, false
    change_column_null :trips, :destination_geocode, false
  end
end
