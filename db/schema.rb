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

ActiveRecord::Schema.define(version: 20160427201530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_signups", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "signup_id"
    t.integer  "event_activity_id"
  end

  add_index "activity_signups", ["event_activity_id"], name: "index_activity_signups_on_event_activity_id", using: :btree
  add_index "activity_signups", ["signup_id"], name: "index_activity_signups_on_signup_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "twitter"
    t.string   "instagram"
    t.boolean  "hide_pii"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_activities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "start_time"
    t.text     "end_time"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
  end

  add_index "event_activities", ["event_id"], name: "index_event_activities_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.integer  "cost"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signups", force: :cascade do |t|
    t.integer  "amount_paid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contact_id"
    t.integer  "event_id"
  end

  add_index "signups", ["contact_id"], name: "index_signups_on_contact_id", using: :btree
  add_index "signups", ["event_id"], name: "index_signups_on_event_id", using: :btree

  add_foreign_key "activity_signups", "event_activities"
  add_foreign_key "activity_signups", "signups"
  add_foreign_key "event_activities", "events"
  add_foreign_key "signups", "contacts"
  add_foreign_key "signups", "events"
end
