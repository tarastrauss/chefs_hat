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

ActiveRecord::Schema.define(version: 20151104233811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hats", force: :cascade do |t|
    t.string   "name"
    t.string   "image_uri"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hats", ["user_id"], name: "index_hats_on_user_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["hat_id"], name: "index_memberships_on_hat_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.text     "instructions"
    t.string   "cook_method"
    t.string   "cook_time"
    t.string   "image_uri"
    t.integer  "user_id"
    t.integer  "hat_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "cook_temp"
  end

  add_index "recipes", ["hat_id"], name: "index_recipes_on_hat_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "profile_pic_uri"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "username"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_foreign_key "hats", "users"
  add_foreign_key "memberships", "hats"
  add_foreign_key "memberships", "users"
  add_foreign_key "recipes", "hats"
  add_foreign_key "recipes", "users"
end
