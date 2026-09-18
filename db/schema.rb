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

ActiveRecord::Schema[8.1].define(version: 2026_09_18_133939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "interactions", force: :cascade do |t|
    t.string "annexes"
    t.string "auteur"
    t.datetime "created_at", null: false
    t.datetime "date_interaction"
    t.string "interaction_type"
    t.string "moyen"
    t.text "note"
    t.bigint "student_id", null: false
    t.date "suivi_delai"
    t.boolean "suivi_necessaire"
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_interactions_on_student_id"
  end

  create_table "people", force: :cascade do |t|
    t.text "a_propos"
    t.string "adresse"
    t.string "cp"
    t.datetime "created_at", null: false
    t.date "date_naissance"
    t.string "email"
    t.string "formule"
    t.string "lieu"
    t.string "nom"
    t.string "prenom"
    t.string "telephone"
    t.string "telephone_2"
    t.string "titre"
    t.datetime "updated_at", null: false
  end

  create_table "prospects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_premier_contact"
    t.string "instrument"
    t.bigint "person_id", null: false
    t.string "source"
    t.string "statut"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_prospects_on_person_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_fin"
    t.date "date_inscription"
    t.string "instrument"
    t.string "niveau"
    t.bigint "person_id"
    t.string "statut"
    t.string "style"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_students_on_person_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_debut"
    t.date "date_fin"
    t.string "instrument"
    t.bigint "person_id", null: false
    t.string "statut"
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

  add_foreign_key "interactions", "students"
  add_foreign_key "prospects", "people"
  add_foreign_key "students", "people"
  add_foreign_key "teachers", "people"
  add_foreign_key "todos", "people"
end
