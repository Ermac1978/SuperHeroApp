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

ActiveRecord::Schema.define(version: 20141105165135) do

  create_table "super_heros", force: true do |t|
    t.string   "hero_name"
    t.string   "secret_identity"
    t.string   "powers"
    t.string   "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic"
    t.integer  "user_id"
  end

  add_index "super_heros", ["user_id"], name: "index_super_heros_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",       limit: 25, default: "user"
  end

end
