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

ActiveRecord::Schema.define(version: 20141117235446) do

  create_table "cities", force: true do |t|
    t.integer  "state_id"
    t.integer  "county_id"
    t.string   "name"
    t.decimal  "latitude",   precision: 10, scale: 7
    t.decimal  "longtitude", precision: 10, scale: 7
    t.string   "gnis"
    t.string   "fips"
    t.integer  "msa"
    t.integer  "usa"
    t.integer  "cbsa"
    t.integer  "csa"
    t.integer  "psa"
    t.integer  "dma"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["fips"], name: "index_cities_on_fips", using: :btree
  add_index "cities", ["gnis"], name: "index_cities_on_gnis", using: :btree
  add_index "cities", ["slug"], name: "index_cities_on_slug", using: :btree

  create_table "counties", force: true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.string   "county_type"
    t.integer  "county_id"
    t.string   "fips"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "counties", ["fips"], name: "index_counties_on_fips", using: :btree
  add_index "counties", ["slug"], name: "index_counties_on_slug", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "state_id"
    t.string   "fips"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "states", ["slug"], name: "index_states_on_slug", using: :btree

end
