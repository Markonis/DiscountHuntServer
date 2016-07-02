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

ActiveRecord::Schema.define(version: 20160702154250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discount_searches", force: :cascade do |t|
    t.text     "query"
    t.text     "result"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "discount_searches", ["user_id"], name: "index_discount_searches_on_user_id", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.integer  "votes",       default: 0
    t.decimal  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "photo_id"
    t.integer  "location_id"
    t.integer  "user_id"
  end

  add_index "discounts", ["location_id"], name: "index_discounts_on_location_id", using: :btree
  add_index "discounts", ["photo_id"], name: "index_discounts_on_photo_id", using: :btree
  add_index "discounts", ["user_id"], name: "index_discounts_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_a_id"
    t.integer  "user_b_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status",     default: "pending"
  end

  add_index "friendships", ["user_a_id"], name: "index_friendships_on_user_a_id", using: :btree
  add_index "friendships", ["user_b_id"], name: "index_friendships_on_user_b_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.decimal  "lng",        precision: 10, scale: 6
    t.decimal  "lat",        precision: 10, scale: 6
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text     "data"
    t.string   "file_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.boolean  "enable_background_process", default: true
    t.integer  "search_radius",             default: 5
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id", using: :btree

  create_table "user_devices", force: :cascade do |t|
    t.string   "hardware_uuid"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "user_searches", force: :cascade do |t|
    t.string   "query"
    t.string   "hardware_uuid"
    t.text     "result"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_searches", ["user_id"], name: "index_user_searches_on_user_id", using: :btree

  create_table "user_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "archived",   default: false
  end

  add_index "user_sessions", ["user_id"], name: "index_user_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "username"
    t.string   "encrypted_password"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "photo_id"
    t.integer  "location_id"
    t.string   "encrypted_password_iv"
  end

  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["photo_id"], name: "index_users_on_photo_id", using: :btree

  add_foreign_key "discounts", "users"
  add_foreign_key "settings", "users"
end
