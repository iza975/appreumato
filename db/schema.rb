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

ActiveRecord::Schema[7.0].define(version: 2023_11_06_122437) do
  create_table "dors", force: :cascade do |t|
    t.string "location"
    t.string "other_location"
    t.string "intensity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.string "frequency"
    t.boolean "taken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "medication_name"
    t.string "medication_dose"
    t.string "medication_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medication_records_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.time "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_medications_on_user_id"
  end

  create_table "pain_records", force: :cascade do |t|
    t.string "location"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pain_intensity"
    t.index ["user_id"], name: "index_pain_records_on_user_id"
  end

  create_table "sleep_records", force: :cascade do |t|
    t.float "sleep_duration"
    t.string "restful_sleep"
    t.string "woke_up"
    t.string "dreams_nightmares"
    t.text "sleep_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "age"
    t.string "gender"
    t.string "disease"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medication_records", "users"
  add_foreign_key "medications", "users"
  add_foreign_key "pain_records", "users"
end
