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

ActiveRecord::Schema.define(version: 2021_06_11_090353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "product_description"
    t.float "price"
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seller_page_id"
    t.string "image"
    t.index ["seller_page_id"], name: "index_products_on_seller_page_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating", default: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seller_page_id"
    t.bigint "user_id"
    t.string "reviewer_first_name"
    t.string "reviewer_last_name"
    t.index ["seller_page_id"], name: "index_reviews_on_seller_page_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "seller_pages", force: :cascade do |t|
    t.string "business_name"
    t.string "business_info"
    t.boolean "verified", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "phone_number"
    t.string "authy_id"
    t.bigint "review_id"
    t.string "region"
    t.string "city"
    t.string "slug"
    t.string "messenger_url"
    t.index ["review_id"], name: "index_seller_pages_on_review_id"
    t.index ["slug"], name: "index_seller_pages_on_slug", unique: true
    t.index ["user_id"], name: "index_seller_pages_on_user_id"
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
    t.string "city"
    t.string "provider"
    t.string "uid"
    t.string "region"
    t.boolean "from_facebook", default: false
    t.string "profile_image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "seller_pages"
  add_foreign_key "reviews", "seller_pages"
  add_foreign_key "reviews", "users"
  add_foreign_key "seller_pages", "reviews"
  add_foreign_key "seller_pages", "users"
end
