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

ActiveRecord::Schema.define(version: 2019_05_09_200858) do

  create_table "", id: false, force: :cascade do |t|
    t.text "NCT03243305\t170280\tPrincipal Investigator\t\tRovena Reagan", limit: 255
    t.text "MD\t1", limit: 255
  end

  create_table "appointments", force: :cascade do |t|
    t.string "user_id"
    t.string "doctor_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", primary_key: "id_condition", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "CONDITION", limit: 255
  end

  create_table "facilities", primary_key: "id_facility", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "NO", limit: 255
    t.text "STATUS", limit: 255
    t.text "FACILITY_NAME", limit: 255
    t.text "CITY", limit: 255
    t.text "STATE", limit: 255
    t.text "ZIP", limit: 255
    t.text "COUNTRY", limit: 255
  end

  create_table "interventions", primary_key: "id_intervention", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "NO", limit: 255
    t.text "INTERVENTION_TYPE", limit: 255
    t.text "INTERVENTION_NAME", limit: 255
    t.text "DESCRIPTION", limit: 255
  end

  create_table "investigators", primary_key: "id_investigator", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "NO", limit: 255
    t.text "NAME_DEGREE", limit: 255
    t.text "ROLE", limit: 255
    t.text "AFFILIATION", limit: 255
  end

  create_table "sponsors", primary_key: "id_sponsor", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "SPONSOR_TYPE", limit: 255
    t.text "AGENCY", limit: 255
    t.text "AGENCY_CLASS", limit: 255
  end

  create_table "studies", id: :text, limit: 255, force: :cascade do |t|
    t.text "NCT_ID", limit: 255
    t.text "OFFICIAL_TITLE", limit: 255
    t.text "BRIEF_SUMMARY", limit: 255
    t.text "PHASE", limit: 255
    t.text "CRITERIA", limit: 255
    t.text "MINIMUM_AGE", limit: 255
    t.text "MAXIMUM_AGE", limit: 255
    t.text "GENDER", limit: 255
    t.text "START_DATE", limit: 255
    t.text "TARGET_DURATION", limit: 255
    t.text "PRIMARY_COMPLETION_DATE", limit: 255
    t.text "COMPLETION_DATE", limit: 255
    t.text "ENROLLMENT", limit: 255
    t.text "ENROLLMENT_TYPE", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "health"
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

end
