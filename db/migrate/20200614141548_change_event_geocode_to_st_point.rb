class Event
end

class ChangeEventGeocodeToStPoint < ActiveRecord::Migration[6.0]
  def up
    add_column :events, :geocode_point, :st_point, geographic: true
    add_index :events, :geocode_point, using: :gist
    change_column_null :events, :geocode, true
    Event.find_each do |event|
      event.geocode_point = "POINT(#{event.geocode.last} #{event.geocode.first})"
      event.save!
    end
  end

  def down
    remove_index :events, :geocode_point
    remove_column :events, :geocode_point
    change_column_null :events, :geocode, false
  end
end
