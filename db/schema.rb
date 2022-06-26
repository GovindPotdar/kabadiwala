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

ActiveRecord::Schema[7.0].define(version: 2022_06_22_094052) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "scrap_id", null: false
    t.decimal "price"
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scrap_id"], name: "index_items_on_scrap_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "items_orders", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "order_id", null: false
    t.index ["item_id"], name: "index_items_orders_on_item_id"
    t.index ["order_id"], name: "index_items_orders_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "pickup_address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["pickup_address_id"], name: "index_orders_on_pickup_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pickup_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "city_id", null: false
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_pickup_addresses_on_city_id"
    t.index ["user_id"], name: "index_pickup_addresses_on_user_id"
  end

  create_table "scraps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_class"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "full_name", null: false
    t.string "mobile_number", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "items", "scraps"
  add_foreign_key "items", "units"
  add_foreign_key "items_orders", "items"
  add_foreign_key "items_orders", "orders"
  add_foreign_key "orders", "pickup_addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "pickup_addresses", "cities"
  add_foreign_key "pickup_addresses", "users"
end