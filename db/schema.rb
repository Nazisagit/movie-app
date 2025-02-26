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

ActiveRecord::Schema[7.1].define(version: 2024_06_29_072112) do
  create_table "accreditations", force: :cascade do |t|
    t.integer "persona_id", null: false
    t.string "accreditable_type", null: false
    t.integer "accreditable_id", null: false
    t.integer "accreditation_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accreditable_type", "accreditable_id"], name: "index_accreditations_on_accreditable"
    t.index ["persona_id"], name: "index_accreditations_on_persona_id"
  end

  create_table "filmable_filming_locations", force: :cascade do |t|
    t.string "filmable_type", null: false
    t.integer "filmable_id", null: false
    t.integer "filming_location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filmable_id", "filmable_type", "filming_location_id"], name: "idx_on_filmable_id_filmable_type_filming_location_i_2e9f91d2ed", unique: true
    t.index ["filmable_type", "filmable_id"], name: "index_filmable_filming_locations_on_filmable"
    t.index ["filming_location_id"], name: "index_filmable_filming_locations_on_filming_location_id"
  end

  create_table "filming_locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "country"], name: "index_filming_locations_on_name_and_country", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "avg_rating", default: 0, null: false
    t.index ["title", "year"], name: "index_movies_on_title_and_year", unique: true
  end

  create_table "personas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_personas_on_name", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rating", default: 5, null: false
    t.string "comment", default: ""
    t.string "reviewable_type", null: false
    t.integer "reviewable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_id", "user_id"], name: "index_reviews_on_reviewable_id_and_user_id", unique: true
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accreditations", "personas"
  add_foreign_key "filmable_filming_locations", "filming_locations"
  add_foreign_key "reviews", "users"
end
