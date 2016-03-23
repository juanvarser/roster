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

ActiveRecord::Schema.define(version: 20160323104006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cache"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.integer  "comission"
  end

  add_index "bands", ["user_id"], name: "index_bands_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "price"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "band_id"
    t.integer  "venue_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "event_type"
    t.boolean  "completed",          default: false
  end

  add_index "events", ["band_id"], name: "index_events_on_band_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "finances", force: :cascade do |t|
    t.string   "concept"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "concept_type"
    t.integer  "event_id"
  end

  add_index "finances", ["event_id"], name: "index_finances_on_event_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "instrument"
    t.string   "gear"
    t.boolean  "special_food"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "band_id"
  end

  add_index "members", ["band_id"], name: "index_members_on_band_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "quantity"
    t.integer  "band_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "products", ["band_id"], name: "index_products_on_band_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "report_type"
    t.date     "report_date"
    t.string   "payload"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
  end

  add_index "reports", ["event_id"], name: "index_reports_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.integer  "cache"
    t.string   "contact_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "venues", ["event_id"], name: "index_venues_on_event_id", using: :btree
  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

end
