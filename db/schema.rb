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

ActiveRecord::Schema.define(version: 2020_11_03_070400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date "date"
    t.string "status"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_attendances_on_employee_id"
  end

  create_table "employee_payment_records", force: :cascade do |t|
    t.date "date"
    t.integer "amount"
    t.string "description"
    t.boolean "is_settled"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_employee_payment_records_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "license_number"
    t.string "adhaar_number"
    t.string "mobile_number"
    t.integer "salary"
    t.string "designation"
    t.boolean "is_working"
    t.bigint "site_id"
    t.index ["site_id"], name: "index_employees_on_site_id"
  end

  create_table "owner_expenses", force: :cascade do |t|
    t.date "date"
    t.bigint "amount"
    t.string "description"
    t.bigint "owner_id", null: false
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_owner_expenses_on_owner_id"
    t.index ["site_id"], name: "index_owner_expenses_on_site_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.bigint "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.integer "default_truck_capacity"
    t.integer "lnt_basic_charge"
    t.string "lnt_leading_charge"
    t.integer "excavation_charges"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_records", force: :cascade do |t|
    t.date "trip_date"
    t.integer "trip_count"
    t.integer "distance"
    t.integer "revenue"
    t.integer "truck_capacity"
    t.integer "diesel_quatity"
    t.integer "diesel_price"
    t.string "chainage"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "excavation_done", default: true
    t.boolean "loading_and_trasportaion_done", default: true
    t.index ["site_id"], name: "index_trip_records_on_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "mobile_no"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "employees"
  add_foreign_key "employee_payment_records", "employees"
  add_foreign_key "employees", "sites"
  add_foreign_key "owner_expenses", "owners"
  add_foreign_key "owner_expenses", "sites"
end
