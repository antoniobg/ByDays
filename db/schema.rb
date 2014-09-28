# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140928133008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "customer_name"
    t.string   "customer_email"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_price"
  end

  add_index "bookings", ["created_at"], name: "index_bookings_on_created_at", using: :btree
  add_index "bookings", ["customer_email"], name: "index_bookings_on_customer_email", using: :btree
  add_index "bookings", ["room_id"], name: "index_bookings_on_room_id", using: :btree
  add_index "bookings", ["start_date"], name: "index_bookings_on_start_date", using: :btree

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotels", ["name"], name: "index_hotels_on_name", using: :btree

  create_table "room_types", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  add_index "room_types", ["hotel_id"], name: "index_room_types_on_hotel_id", using: :btree

  create_table "rooms", force: true do |t|
    t.integer  "room_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["room_type_id"], name: "index_rooms_on_room_type_id", using: :btree

end
