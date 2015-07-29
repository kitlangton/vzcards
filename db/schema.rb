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

ActiveRecord::Schema.define(version: 20150729195302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "template_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "instance_id"
    t.string   "alias"
    t.string   "alias2"
    t.decimal  "two_year_price",     precision: 8, scale: 2
    t.decimal  "full_retail_price",  precision: 8, scale: 2
    t.date     "effective_date"
    t.integer  "device_id"
  end

  add_index "cards", ["device_id"], name: "index_cards_on_device_id", using: :btree
  add_index "cards", ["name"], name: "index_cards_on_name", using: :btree
  add_index "cards", ["template_id"], name: "index_cards_on_template_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "alias2"
    t.string   "manufacturer"
    t.string   "sku"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string   "ids_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "templates", ["ids_id"], name: "index_templates_on_ids_id", using: :btree

  add_foreign_key "cards", "devices"
  add_foreign_key "cards", "templates"
end
