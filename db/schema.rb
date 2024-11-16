# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_16_181817) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string "restaurant"
    t.string "order"
    t.decimal "total"
    t.decimal "tip"
    t.boolean "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.string "address"
    t.bigint "school_id"
    t.index ["profile_id"], name: "index_orders_on_profile_id"
    t.index ["school_id"], name: "index_orders_on_school_id"
  end

  create_table "postings", force: :cascade do |t|
    t.string "place"
    t.text "description"
    t.integer "rating"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.bigint "profile_id"
    t.string "img"
    t.index ["profile_id"], name: "index_postings_on_profile_id"
    t.index ["school_id"], name: "index_postings_on_school_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "tag"
    t.string "school"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "school_id"
    t.index ["school_id"], name: "index_profiles_on_school_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "profiles"
  add_foreign_key "orders", "schools"
  add_foreign_key "postings", "profiles"
  add_foreign_key "postings", "schools"
  add_foreign_key "profiles", "schools"
  add_foreign_key "profiles", "users"
end
