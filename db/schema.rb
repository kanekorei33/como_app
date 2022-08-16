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

ActiveRecord::Schema.define(version: 2022_08_16_183938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comment_categories", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_comment_categories_on_category_id"
    t.index ["comment_id"], name: "index_comment_categories_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.text "image"
    t.bigint "user_id", null: false
    t.bigint "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_comments_on_park_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_favorites_on_park_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.text "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "park_institutions", force: :cascade do |t|
    t.bigint "park_id", null: false
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_park_institutions_on_institution_id"
    t.index ["park_id"], name: "index_park_institutions_on_park_id"
  end

  create_table "park_playgrounds", force: :cascade do |t|
    t.bigint "park_id", null: false
    t.bigint "playground_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_park_playgrounds_on_park_id"
    t.index ["playground_id"], name: "index_park_playgrounds_on_playground_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name", null: false
    t.text "Introduction", null: false
    t.string "address", null: false
    t.string "prefecture"
    t.float "latitude"
    t.float "longitude"
    t.text "main_image", null: false
    t.text "sub_image1"
    t.text "sub_image2"
    t.text "sub_image3"
    t.text "sub_image4"
    t.text "sub_image5"
    t.text "sub_image6"
    t.text "sub_image7"
    t.text "sub_image8"
    t.text "sub_image9"
    t.text "sub_image10"
    t.text "sub_image11"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playgrounds", force: :cascade do |t|
    t.string "name", null: false
    t.text "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.string "password_digest"
    t.text "image"
    t.string "profile"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comment_categories", "categories"
  add_foreign_key "comment_categories", "comments"
  add_foreign_key "comments", "parks"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "parks"
  add_foreign_key "favorites", "users"
  add_foreign_key "park_institutions", "institutions"
  add_foreign_key "park_institutions", "parks"
  add_foreign_key "park_playgrounds", "parks"
  add_foreign_key "park_playgrounds", "playgrounds"
end
