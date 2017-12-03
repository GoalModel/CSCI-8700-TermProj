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

ActiveRecord::Schema.define(version: 20171018102359) do

  create_table "matters", force: :cascade do |t|
    t.string   "name_or_type"
    t.string   "location"
    t.date     "acquired_date"
    t.integer  "value"
    t.string   "loaned_to"
    t.date     "loaned_date"
    t.text     "description"
    t.text     "notes"
    t.integer  "upc_barcode"
    t.string   "title"
    t.date     "released_date"
    t.string   "format"
    t.string   "artist_or_band"
    t.text     "track_list"
    t.boolean  "amateur"
    t.text     "lineage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
