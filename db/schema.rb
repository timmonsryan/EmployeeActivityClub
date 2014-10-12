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

ActiveRecord::Schema.define(version: 20141012185116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "freeGuest"
    t.integer  "paidGuests"
  end

  add_index "appointments", ["event_id"], name: "index_appointments_on_event_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "picture"
    t.float    "guestCost"
    t.boolean  "locked"
    t.boolean  "giveaway"
  end

  create_table "users", force: true do |t|
    t.string   "tellerNumber"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "department"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
