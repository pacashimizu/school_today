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

ActiveRecord::Schema.define(version: 2022_06_05_131317) do

  create_table "article_images", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_images_on_article_id"
  end

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "grade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grade_id"], name: "index_articles_on_grade_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "grades", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "login_id"
    t.string "password_digest"
    t.string "comment"
    t.boolean "teacher", default: false
    t.bigint "grade_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grade_id"], name: "index_users_on_grade_id"
  end

  add_foreign_key "article_images", "articles"
  add_foreign_key "articles", "grades"
  add_foreign_key "articles", "users"
  add_foreign_key "users", "grades"
end
