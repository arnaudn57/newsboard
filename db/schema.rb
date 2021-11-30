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

ActiveRecord::Schema.define(version: 2021_11_30_095734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer "time_reading"
    t.string "title"
    t.string "image"
    t.text "content"
    t.string "category"
    t.string "sub_category"
    t.string "source"
    t.string "url"
    t.string "publish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.integer "time_reading"
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "favoris", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "medium_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_favoris_on_medium_id"
    t.index ["user_id"], name: "index_favoris_on_user_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.string "mediable_type", null: false
    t.bigint "mediable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_media_on_dashboard_id"
    t.index ["mediable_type", "mediable_id"], name: "index_media_on_mediable"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "sub_category"
    t.string "url"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "audio"
    t.string "description"
  end

  create_table "user_categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "category"
    t.boolean "sub_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "user_media_types", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "media_types"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_media_types_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "available_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "sub_category"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dashboards", "users"
  add_foreign_key "favoris", "media"
  add_foreign_key "favoris", "users"
  add_foreign_key "media", "dashboards"
  add_foreign_key "user_categories", "users"
  add_foreign_key "user_media_types", "users"
end
