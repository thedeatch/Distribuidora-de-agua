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

ActiveRecord::Schema.define(version: 20180909012900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.integer "income"
    t.boolean "license", default: true
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers_trucks", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "day"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "delivery_date"
    t.integer "amount"
    t.integer "client_id"
    t.integer "truck_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "detail"
    t.integer "price"
    t.integer "product_number"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "liters"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "name"
    t.float "load"
    t.string "number_plate"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "employee"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "drivers_trucks", "drivers"
  add_foreign_key "drivers_trucks", "trucks"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "trucks"
end
