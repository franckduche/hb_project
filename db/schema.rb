# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_070032) do

  create_table "event_attribute_values", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "event_attribute_id", null: false
    t.string "string_value"
    t.boolean "boolean_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_attribute_id"], name: "index_event_attribute_values_on_event_attribute_id"
    t.index ["event_id"], name: "index_event_attribute_values_on_event_id"
  end

  create_table "event_attributes", force: :cascade do |t|
    t.string "label"
    t.integer "field_type"
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_attribute_values", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user_attribute_id", null: false
    t.string "string_value"
    t.boolean "boolean_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_attribute_id"], name: "index_user_attribute_values_on_user_attribute_id"
    t.index ["user_id"], name: "index_user_attribute_values_on_user_id"
  end

  create_table "user_attributes", force: :cascade do |t|
    t.string "label"
    t.integer "field_type"
    t.boolean "display_on_profile"
    t.boolean "display_on_signup"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "required_on_profile"
    t.boolean "required_on_signup"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "event_attribute_values", "event_attributes"
  add_foreign_key "event_attribute_values", "events"
  add_foreign_key "user_attribute_values", "user_attributes"
  add_foreign_key "user_attribute_values", "users"
end
