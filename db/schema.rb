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

ActiveRecord::Schema.define(version: 2019_11_07_014640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "tag"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "url"
    t.integer "category_id"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index "url, md5((title)::text), md5(summary)", name: "index_news_on_url_and_title_and_summary", unique: true
  end

  create_table "news_users", id: false, force: :cascade do |t|
    t.bigint "news_id", null: false
    t.bigint "user_id", null: false
    t.index ["news_id"], name: "index_news_users_on_news_id"
    t.index ["user_id"], name: "index_news_users_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.text "homepage_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "feed_url"
    t.jsonb "feed_options", default: {}, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_sources_on_category_id"
  end

  create_table "sources_users", id: false, force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "user_id", null: false
    t.index ["source_id"], name: "index_sources_users_on_source_id"
    t.index ["user_id"], name: "index_sources_users_on_user_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_user_categories_on_categories_id"
    t.index ["users_id"], name: "index_user_categories_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "news", "categories"
  add_foreign_key "news", "sources"
  add_foreign_key "sources", "categories"
end
