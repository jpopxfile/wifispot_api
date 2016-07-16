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

ActiveRecord::Schema.define(version: 20160714141118) do

  create_table "wifispots", force: :cascade do |t|
    t.integer  "spot_id",      limit: 4
    t.string   "name_jp",      limit: 255
    t.string   "name_en",      limit: 255
    t.string   "status",       limit: 255
    t.string   "category",     limit: 255
    t.string   "usable_place", limit: 255
    t.string   "postcode",     limit: 255
    t.string   "prefecture",   limit: 255
    t.string   "address_jp",   limit: 255
    t.string   "address_en",   limit: 255
    t.string   "tel",          limit: 255
    t.string   "open_time",    limit: 255
    t.string   "ssid",         limit: 255
    t.string   "usable_time",  limit: 255
    t.string   "procedure",    limit: 255
    t.string   "lang_support", limit: 255
    t.string   "languages",    limit: 255
    t.string   "url",          limit: 255
    t.float    "y_coord",      limit: 24
    t.float    "x_coord",      limit: 24
    t.string   "place_code",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
