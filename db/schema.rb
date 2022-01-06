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

ActiveRecord::Schema.define(version: 2022_01_06_000920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "number_of_animals"
    t.boolean "special_needs?"
    t.string "special_needs_details"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_farms_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "farm_id"
    t.index ["farm_id"], name: "index_missions_on_farm_id"
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "user_type"
    t.boolean "is_available_for_missions?"
    t.integer "rescuer_trailer_capacity"
  end

  add_foreign_key "farms", "users"
  add_foreign_key "missions", "farms"
  add_foreign_key "missions", "users"
end
