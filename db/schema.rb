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

ActiveRecord::Schema.define(version: 20150926014101) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.string   "gender"
    t.string   "group_size"
    t.string   "type1"
    t.string   "type2"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["age"], name: "index_activities_on_age"
  add_index "activities", ["cost"], name: "index_activities_on_cost"
  add_index "activities", ["gender"], name: "index_activities_on_gender"
  add_index "activities", ["group_size"], name: "index_activities_on_group_size"
  add_index "activities", ["type1"], name: "index_activities_on_type1"
  add_index "activities", ["type2"], name: "index_activities_on_type2"

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
