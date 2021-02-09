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

ActiveRecord::Schema.define(version: 2021_02_08_182248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "choosen_day"
    t.text "note"
    t.integer "available_from"
    t.integer "available_until"
    t.boolean "approved_by_orphanage", default: false
    t.integer "volunteer_id"
    t.integer "orphanage_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orphanage_volunteers", force: :cascade do |t|
    t.integer "orphanage_id"
    t.integer "volunteer_id"
  end

  create_table "orphanages", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "phone_number"
    t.string "email"
    t.integer "children_count"
    t.boolean "accepts_new_cases", default: false
    t.text "bio"
    t.string "password_digest"
    t.boolean "verified", default: false
    t.string "governorate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "body"
    t.boolean "fulfilled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "orphanage_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "phone_number"
    t.string "email"
    t.date "birth_date"
    t.string "job"
    t.string "password_digest"
    t.string "governorate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
