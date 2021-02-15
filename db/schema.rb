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

ActiveRecord::Schema.define(version: 2021_02_15_091520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

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

  create_table "report_cases", force: :cascade do |t|
    t.string "name"
    t.boolean "case_resolved", default: false
    t.boolean "case_accepted", default: false
    t.string "street_address"
    t.string "approximate_age"
    t.text "description"
    t.text "note"
    t.text "health_state"
    t.integer "volunteer_id"
    t.string "governorate"
    t.integer "orphanage_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "personal_id"
  end

end
