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

ActiveRecord::Schema.define(version: 20170703140225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "intervention"
    t.integer  "tank_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "old_quantity"
    t.integer  "new_quantity"
    t.index ["tank_id"], name: "index_activities_on_tank_id", using: :btree
  end

  create_table "tanks", force: :cascade do |t|
    t.string   "tank_name"
    t.integer  "quantity"
    t.integer  "quantity_max"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "activities", "tanks"
end
