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

ActiveRecord::Schema.define(version: 2021_11_29_150022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "status"
    t.string "score"
    t.string "secret_counter"
    t.string "open_question"
    t.bigint "user_id"
    t.bigint "mission_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_challenges_on_mission_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "clues", force: :cascade do |t|
    t.string "description"
    t.integer "level"
    t.bigint "mission_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_clues_on_mission_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "secret_place"
    t.string "name"
    t.string "category"
<<<<<<< HEAD
<<<<<<< HEAD
=======
    t.float "lat"
    t.float "long"
    t.string "photo_url"
>>>>>>> 12ad9bbc6c8bd979ee61366c4ef9a082e88da128
=======
>>>>>>> 47dc8ef4238b23cc7db18689aa67393ad00ca018
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_questions_on_mission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
