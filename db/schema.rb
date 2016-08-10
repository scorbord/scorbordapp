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

ActiveRecord::Schema.define(version: 20160810100510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "status"
    t.string   "token"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "nickname"
    t.string   "cell_phone"
    t.string   "grad_year"
    t.integer  "person_id"
  end

  add_index "members", ["person_id"], name: "index_members_on_person_id", using: :btree
  add_index "members", ["team_id"], name: "index_members_on_team_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "gender"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "position_teams", force: :cascade do |t|
    t.integer "position_id"
    t.integer "team_id"
  end

  add_index "position_teams", ["position_id"], name: "index_position_teams_on_position_id", using: :btree
  add_index "position_teams", ["team_id"], name: "index_position_teams_on_team_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer "sport"
    t.string  "name"
    t.string  "initials"
    t.integer "side"
  end

  create_table "programs", force: :cascade do |t|
    t.integer "sport"
    t.integer "school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "mascot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "password_reset_token"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "members", "people"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "people", "users"
end
