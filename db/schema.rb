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

ActiveRecord::Schema[8.1].define(version: 2026_09_15_114535) do
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

  create_table "students", force: :cascade do |t|
    t.string "adresse"
    t.string "cp"
    t.datetime "created_at", null: false
    t.date "date_fin"
    t.date "date_inscription"
    t.date "date_naissance"
    t.string "email"
    t.string "lieu"
    t.string "niveau"
    t.string "nom"
    t.string "prenom"
    t.string "statut"
    t.string "style"
    t.string "telephone"
    t.string "telephone2"
    t.string "titre"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interactions", "students"
end
