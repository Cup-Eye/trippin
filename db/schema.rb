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

ActiveRecord::Schema.define(version: 2019_08_29_093401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "user_id"
    t.string "url"
    t.string "name"
    t.string "address"
    t.integer "price"
    t.string "kind"
    t.integer "rating"
    t.boolean "winning", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_accommodations_on_board_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "type"
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_boards_on_trip_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.bigint "board_id"
    t.string "name"
    t.bigint "user_id"
    t.text "description"
    t.boolean "winning", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_destinations_on_board_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "timeframes", force: :cascade do |t|
    t.bigint "board_id"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.text "description"
    t.boolean "winning", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_timeframes_on_board_id"
    t.index ["user_id"], name: "index_timeframes_on_user_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.bigint "board_id"
    t.string "route_number"
    t.string "booking_number"
    t.bigint "user_id"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.string "departure_location"
    t.string "arrival_location"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_transportations_on_board_id"
    t.index ["user_id"], name: "index_transportations_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "destination"
    t.date "start_date"
    t.date "end_date"
    t.boolean "winning", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodations", "boards"
  add_foreign_key "accommodations", "users"
  add_foreign_key "boards", "trips"
  add_foreign_key "destinations", "boards"
  add_foreign_key "destinations", "users"
  add_foreign_key "timeframes", "boards"
  add_foreign_key "timeframes", "users"
  add_foreign_key "transportations", "boards"
  add_foreign_key "transportations", "users"
  add_foreign_key "trips", "users"
end
