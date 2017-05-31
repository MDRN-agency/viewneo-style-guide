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

ActiveRecord::Schema.define(version: 20170117070503) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "provider"], name: "index_authorizations_on_user_id_and_provider", unique: true
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name",            null: false
    t.text   "summary"
    t.text   "description"
    t.string "industry"
    t.string "logo"
    t.string "thumbnail_photo"
  end

  create_table "brands_deals", force: :cascade do |t|
    t.integer "brand_id", null: false
    t.integer "deal_id",  null: false
    t.index ["brand_id", "deal_id"], name: "index_brands_deals_on_brand_id_and_deal_id", unique: true
    t.index ["brand_id"], name: "index_brands_deals_on_brand_id"
    t.index ["deal_id"], name: "index_brands_deals_on_deal_id"
  end

  create_table "brands_listings", force: :cascade do |t|
    t.integer "brand_id",   null: false
    t.integer "listing_id", null: false
    t.index ["brand_id", "listing_id"], name: "index_brands_listings_on_brand_id_and_listing_id", unique: true
    t.index ["brand_id"], name: "index_brands_listings_on_brand_id"
    t.index ["listing_id"], name: "index_brands_listings_on_listing_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",            null: false
    t.text     "summary"
    t.text     "description"
    t.string   "industry"
    t.string   "logo"
    t.string   "thumbnail_photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "companies_deals", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "deal_id",    null: false
    t.index ["company_id", "deal_id"], name: "index_companies_deals_on_company_id_and_deal_id", unique: true
    t.index ["company_id"], name: "index_companies_deals_on_company_id"
    t.index ["deal_id"], name: "index_companies_deals_on_deal_id"
  end

  create_table "companies_listings", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "listing_id", null: false
    t.index ["company_id", "listing_id"], name: "index_companies_listings_on_company_id_and_listing_id", unique: true
    t.index ["company_id"], name: "index_companies_listings_on_company_id"
    t.index ["listing_id"], name: "index_companies_listings_on_listing_id"
  end

  create_table "deal_options", force: :cascade do |t|
    t.integer  "deal_id",        null: false
    t.string   "title",          null: false
    t.text     "details"
    t.float    "original_price"
    t.float    "deal_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["deal_id"], name: "index_deal_options_on_deal_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string   "title",           null: false
    t.text     "teaser"
    t.text     "description"
    t.string   "thumbnail_photo"
    t.string   "cover_photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "listing_photos", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.string  "caption"
    t.string  "image",      null: false
    t.index ["listing_id"], name: "index_listing_photos_on_listing_id"
  end

  create_table "listing_videos", force: :cascade do |t|
    t.integer "listing_id"
    t.string  "caption"
    t.string  "url",        null: false
    t.index ["listing_id"], name: "index_listing_videos_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "slug",            null: false
    t.string   "type",            null: false
    t.text     "summary"
    t.text     "description"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "website_url"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "logo"
    t.string   "cover_photo"
    t.string   "thumbnail_photo"
    t.index ["slug"], name: "index_listings_on_slug", unique: true
    t.index ["type"], name: "index_listings_on_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "location"
    t.string   "industry"
    t.string   "phone"
    t.string   "description"
    t.string   "linkedin_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "google_plus_url"
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
