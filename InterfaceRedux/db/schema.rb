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

ActiveRecord::Schema.define(version: 20141204141003) do

  create_table "administrators", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "administrators", ["username"], name: "index_administrators_on_username", unique: true

  create_table "requests", force: true do |t|
    t.string   "clid"
    t.string   "gender"
    t.string   "building"
    t.string   "room"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "requests", ["clid"], name: "index_requests_on_clid", unique: true

  create_table "students", force: true do |t|
    t.string   "clid"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "roomtype"
    t.string   "building"
    t.string   "roomid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: true do |t|
    t.string   "room"
    t.string   "occupant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
