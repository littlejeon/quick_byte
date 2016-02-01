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


ActiveRecord::Schema.define(version: 20160201170324) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "logo_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "domains",    default: [],              array: true
  end

  create_table "plans", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.datetime "datetime"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  add_index "plans", ["restaurant_id"], name: "index_plans_on_restaurant_id", using: :btree

  create_table "plans_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plan_id", null: false
  end

  add_index "plans_users", ["plan_id", "user_id"], name: "index_plans_users_on_plan_id_and_user_id", using: :btree
  add_index "plans_users", ["user_id", "plan_id"], name: "index_plans_users_on_user_id_and_plan_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "location"
    t.string   "cuisine"
    t.string   "dietary_needs"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "image_url"
    t.integer  "type_id"
  end

  add_index "restaurants", ["type_id"], name: "index_restaurants_on_type_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "wait_time"
    t.integer  "price"
    t.text     "comment"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "types", ["user_id"], name: "index_types_on_user_id", using: :btree

  create_table "user_organizations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_index "user_organizations", ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
  add_index "user_organizations", ["user_id"], name: "index_user_organizations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

  add_foreign_key "plans", "restaurants"
  add_foreign_key "restaurants", "types"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
  add_foreign_key "types", "users"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "users"
  add_foreign_key "users", "organizations"
end
