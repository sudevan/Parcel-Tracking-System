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

ActiveRecord::Schema.define(version: 2021_01_05_105444) do

  create_table "branch_users", force: :cascade do |t|
    t.string "email"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "consignments", force: :cascade do |t|
    t.integer "destination_pin"
    t.integer "source_pin"
    t.integer "status"
    t.float "weight"
    t.string "tracking_id"
    t.string "source_contact"
    t.string "destination_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "current_location"
    t.integer "next_location"
    t.datetime "pickup_schedulle"
    t.datetime "delivery_schedulle"
    t.string "source_city"
    t.string "destination_city"
    t.string "current_city"
    t.string "next_city"
    t.integer "delivery_time"
    t.integer "pickup_time"
    t.integer "estimated_time"
    t.string "customer_email"
  end

  create_table "histories", force: :cascade do |t|
    t.string "trackid"
    t.string "event"
    t.string "user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parcel_routes", force: :cascade do |t|
    t.integer "route_id"
    t.string "city_1"
    t.string "city_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "travel_time"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "s_pin"
    t.integer "d_pin"
    t.integer "travel_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "route_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_roles", default: "guest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
