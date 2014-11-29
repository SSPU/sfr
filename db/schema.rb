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

ActiveRecord::Schema.define(version: 20141128172157) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["name"], name: "index_admins_on_name", unique: true

  create_table "pictures", force: true do |t|
    t.integer  "product_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "order"
    t.boolean  "cover",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "sn"
    t.string   "name"
    t.integer  "cat"
    t.text     "des"
    t.boolean  "active",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.text     "token"
    t.datetime "expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["token"], name: "index_tokens_on_token", unique: true
  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
