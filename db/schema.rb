# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_29_090746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "state", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "kind", null: false
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_gifts_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "notify", default: true, null: false
    t.index ["school_id"], name: "index_orders_on_school_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.bigint "address_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_recipients_on_address_id"
    t.index ["order_id"], name: "index_recipients_on_order_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_schools_on_address_id"
  end

  add_foreign_key "gifts", "orders"
  add_foreign_key "orders", "schools"
  add_foreign_key "recipients", "addresses"
  add_foreign_key "recipients", "orders"
  add_foreign_key "schools", "addresses"
end
