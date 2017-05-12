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

ActiveRecord::Schema.define(version: 20170506201400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "prospect_id"
    t.string  "program_name"
    t.integer "program_kind"
    t.string  "primary_phone"
    t.string  "email"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "prospect_id"
    t.integer "relation"
    t.integer "salutation"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "primary_phone"
    t.string  "secondary_phone"
    t.string  "email"
    t.string  "facebook"
    t.string  "twitter"
    t.string  "instagram"
    t.string  "snapchat"
  end

  create_table "highlights", force: :cascade do |t|
    t.integer  "prospect_id"
    t.integer  "source"
    t.string   "path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "status"
    t.string   "token"
  end

  create_table "member_position_teams", force: :cascade do |t|
    t.integer "member_id"
    t.integer "position_team_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.boolean  "admin",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "cell_phone"
    t.string   "grad_year"
    t.integer  "person_id"
    t.integer  "jersey_number"
    t.integer  "role"
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
    t.integer "team_unit_id"
  end

  add_index "position_teams", ["position_id"], name: "index_position_teams_on_position_id", using: :btree
  add_index "position_teams", ["team_id"], name: "index_position_teams_on_team_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer "sport"
    t.string  "name"
    t.string  "initials"
    t.integer "side"
    t.integer "position_type"
    t.integer "unit_id"
  end

  create_table "practices", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prospects", force: :cascade do |t|
    t.integer  "college_team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "email"
    t.integer  "hs_grad_year"
    t.string   "cell_phone"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "snapchat"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "intended_major"
    t.string   "club_team_name"
    t.string   "club_team_city"
    t.string   "club_team_state"
    t.string   "high_school_name"
    t.string   "high_school_city"
    t.string   "high_school_state"
    t.text     "notes"
    t.datetime "birthday"
    t.string   "dominant_foot"
    t.string   "position"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "mascot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_units", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "unit_id"
    t.integer  "coach_position_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.integer  "sport"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.integer  "coach_position_id"
    t.integer  "parent_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_type"
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
    t.integer  "current_team_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "members", "people"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "people", "users"
end
