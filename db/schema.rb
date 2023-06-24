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

ActiveRecord::Schema.define(version: 20150809095317) do

  # These are extensions that must be enabled in order to support this database
  #enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "vote_count",    default: 0
    t.integer  "comment_count", default: 0
    t.boolean  "is_visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "view_count",    default: 0
    t.string   "fbuid"
    t.string   "image_url"
    t.string   "category"
  end

  create_table "comments", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "user_uid"
  end

  create_table "feedback_messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.string   "feedback_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  # add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "unpublishedarticles", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.string   "category"
    t.string   "fbuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "email"
    t.string   "provider"
    t.string   "last_name"
    t.boolean  "is_banned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.text     "user_description"
    t.integer  "article_count",    default: 0
    t.integer  "comment_count",    default: 0
    t.boolean  "islucky",          default: false
    t.string   "remember_token"
  end

  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "user_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vote_type"
  end

end
