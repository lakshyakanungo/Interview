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

ActiveRecord::Schema[7.0].define(version: 2024_10_19_073942) do
  create_table "blocked_users", force: :cascade do |t|
    t.integer "for_user_id", null: false
    t.integer "blocked_user_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_user_id_id"], name: "index_blocked_users_on_blocked_user_id_id"
    t.index ["for_user_id"], name: "index_blocked_users_on_for_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_followers_on_from_id"
    t.index ["to_id"], name: "index_followers_on_to_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blocked_users", "users", column: "blocked_user_id_id"
  add_foreign_key "blocked_users", "users", column: "for_user_id"
  add_foreign_key "followers", "users", column: "from_id"
  add_foreign_key "followers", "users", column: "to_id"
  add_foreign_key "posts", "users"
end
