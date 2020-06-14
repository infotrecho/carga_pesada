# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_14_172426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "drivers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "trusted", default: false
    t.string "messenger_id"
    t.index ["messenger_id"], name: "index_drivers_on_messenger_id", unique: true
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "geocode", array: true
    t.text "description", null: false
    t.string "classification", null: false
    t.json "metadata"
    t.integer "priority", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.geography "geocode_point", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.index ["geocode_point"], name: "index_events_on_geocode_point", using: :gist
  end

  create_table "notifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.uuid "trip_id", null: false
    t.boolean "notified", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["trip_id"], name: "index_notifications_on_trip_id"
  end

  create_table "trips", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "origin", null: false
    t.string "destination", null: false
    t.string "origin_geocode", array: true
    t.string "destination_geocode", array: true
    t.uuid "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.geography "origin_geocode_point", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geography "destination_geocode_point", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.index ["destination_geocode_point"], name: "index_trips_on_destination_geocode_point", using: :gist
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["origin_geocode_point"], name: "index_trips_on_origin_geocode_point", using: :gist
  end

  add_foreign_key "notifications", "events"
  add_foreign_key "notifications", "trips"
  add_foreign_key "trips", "drivers"
end
