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

ActiveRecord::Schema.define(version: 20140607075115) do

  create_table "planned_roster_groups", force: true do |t|
    t.date     "month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planned_rosters", force: true do |t|
    t.date     "date"
    t.text     "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "planned_rosters", ["group_id"], name: "index_planned_rosters_on_group_id", using: :btree

  create_table "song_list_items", force: true do |t|
    t.integer  "song_list_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "song_list_items", ["song_id"], name: "index_song_list_items_on_song_id", using: :btree
  add_index "song_list_items", ["song_list_id"], name: "index_song_list_items_on_song_list_id", using: :btree

  create_table "song_lists", force: true do |t|
    t.date     "done_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "theme"
    t.string   "service"
    t.date     "deleted_at"
    t.integer  "leader_id"
  end

  create_table "songs", force: true do |t|
    t.string   "name"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.date     "deleted_at"
  end

  create_table "team_memberships", force: true do |t|
    t.integer  "song_list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_memberships", ["song_list_id"], name: "index_team_memberships_on_song_list_id", using: :btree
  add_index "team_memberships", ["user_id"], name: "index_team_memberships_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
