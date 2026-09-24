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

ActiveRecord::Schema[8.1].define(version: 2026_09_23_104625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "interactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "follow_up_due_date"
    t.boolean "follow_up_needed", default: false
    t.date "interaction_date"
    t.integer "interaction_type"
    t.text "note"
    t.bigint "person_id", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_interactions_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.text "about_me"
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "email"
    t.string "first_name"
    t.string "greeting_formula"
    t.string "last_name"
    t.string "phone"
    t.string "phone_2"
    t.string "postal_code"
    t.string "title"
    t.datetime "updated_at", null: false
    t.boolean "use_tu"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.date "enrollment_date"
    t.date "first_contact_date"
    t.string "instrument"
    t.string "level"
    t.bigint "person_id"
    t.string "source"
    t.string "status"
    t.string "style"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_students_on_person_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.string "instrument"
    t.bigint "person_id", null: false
    t.date "start_date"
    t.string "status"
    t.text "styles"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_teachers_on_person_id"
  end

  create_table "todos", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.text "description"
    t.date "due_date"
    t.string "keywords"
    t.bigint "person_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_todos_on_person_id"
  end

  add_foreign_key "interactions", "people"
  add_foreign_key "students", "people"
  add_foreign_key "teachers", "people"
  add_foreign_key "todos", "people"
end
