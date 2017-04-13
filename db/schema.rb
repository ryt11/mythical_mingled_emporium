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

ActiveRecord::Schema.define(version: 20170413030549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creatures", force: :cascade do |t|
    t.string   "breed"
    t.text     "description"
    t.money    "price",       scale: 2
    t.string   "image_url"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "creatures_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "creature_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_creatures_categories_on_category_id", using: :btree
    t.index ["creature_id"], name: "index_creatures_categories_on_creature_id", using: :btree
  end

  create_table "order_creatures", force: :cascade do |t|
    t.integer "quantity"
    t.integer "creature_id"
    t.integer "order_id"
    t.index ["creature_id"], name: "index_order_creatures_on_creature_id", using: :btree
    t.index ["order_id"], name: "index_order_creatures_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.money    "total",      scale: 2
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "status"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.integer  "role",                  default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_foreign_key "creatures_categories", "categories"
  add_foreign_key "creatures_categories", "creatures"
  add_foreign_key "order_creatures", "creatures"
  add_foreign_key "order_creatures", "orders"
  add_foreign_key "orders", "users"
end
