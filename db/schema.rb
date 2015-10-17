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

ActiveRecord::Schema.define(version: 20151017180524) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.string   "cost"
    t.string   "gender"
    t.string   "group_size"
    t.string   "type1"
    t.string   "type2"
    t.string   "age"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
    t.string   "image_alt"
    t.string   "search_type"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cost"
    t.string   "gender"
    t.string   "group_size"
    t.string   "type1"
    t.string   "type2"
    t.string   "age"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "activity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "search_id"
    t.integer  "activity_id"
    t.string   "formatted_address"
    t.string   "rating"
    t.string   "url"
    t.string   "review_summary"
    t.string   "openings_hours"
    t.string   "price_level"
  end

end
