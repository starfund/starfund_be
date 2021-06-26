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

ActiveRecord::Schema.define(version: 2021_06_26_063844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.date "birthdate"
    t.string "category"
    t.bigint "price_tier_id", null: false
    t.bigint "content_id"
    t.string "slogan"
    t.index ["content_id"], name: "index_businesses_on_content_id"
    t.index ["price_tier_id"], name: "index_businesses_on_price_tier_id"
  end

  create_table "charges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fighter_id"
    t.string "reason"
    t.integer "amount"
    t.index ["fighter_id"], name: "index_charges_on_fighter_id"
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "content_id", null: false
    t.string "message"
    t.index ["content_id"], name: "index_comments_on_content_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "fighter_id", null: false
    t.string "title"
    t.string "description"
    t.date "event_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "public", default: true
    t.boolean "feed", default: true
    t.boolean "published", default: false
    t.string "title_ru"
    t.string "description_ru"
    t.string "title_es"
    t.string "description_es"
    t.integer "fake_likes_count", default: 0
    t.bigint "likes_count", default: 0
    t.index ["fighter_id"], name: "index_contents_on_fighter_id"
  end

  create_table "course_schedules", force: :cascade do |t|
    t.integer "week_day"
    t.time "start_hour"
    t.time "end_hour"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_schedules_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.string "course_goal"
    t.integer "course_type"
    t.bigint "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_courses_on_business_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "card_id"
    t.boolean "default", default: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "exception_hunter_error_groups", force: :cascade do |t|
    t.string "error_class_name", null: false
    t.string "message"
    t.integer "status", default: 0
    t.text "tags", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message"], name: "index_exception_hunter_error_groups_on_message", opclass: :gin_trgm_ops, using: :gin
    t.index ["status"], name: "index_exception_hunter_error_groups_on_status"
  end

  create_table "exception_hunter_errors", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "message"
    t.datetime "occurred_at", null: false
    t.json "environment_data"
    t.json "custom_data"
    t.json "user_data"
    t.string "backtrace", default: [], array: true
    t.bigint "error_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["error_group_id"], name: "index_exception_hunter_errors_on_error_group_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.float "reach"
    t.integer "height"
    t.date "birthdate"
    t.string "organization"
    t.string "preview_url"
    t.integer "sub_price"
    t.bigint "price_tier_id", default: 1, null: false
    t.bigint "content_id"
    t.boolean "support", default: false
    t.index ["content_id"], name: "index_fighters_on_content_id"
    t.index ["price_tier_id"], name: "index_fighters_on_price_tier_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "concept"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "petitions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "topic"
    t.string "requester"
    t.string "receiver"
    t.string "explanation"
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "price_tiers", force: :cascade do |t|
    t.integer "us"
    t.integer "ru"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_settings_on_key", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fighter_id", null: false
    t.integer "last_charge"
    t.datetime "last_charge_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.string "stripe_sub"
    t.index ["fighter_id"], name: "index_subscriptions_on_fighter_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "user_likes", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "user_id", null: false
    t.index ["content_id"], name: "index_user_likes_on_content_id"
    t.index ["user_id"], name: "index_user_likes_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "username", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.string "card_id"
    t.string "customer_id"
    t.date "birthdate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "businesses", "contents"
  add_foreign_key "businesses", "price_tiers"
  add_foreign_key "charges", "fighters"
  add_foreign_key "charges", "users"
  add_foreign_key "comments", "contents"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "fighters"
  add_foreign_key "course_schedules", "courses"
  add_foreign_key "courses", "businesses"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "exception_hunter_errors", "exception_hunter_error_groups", column: "error_group_id"
  add_foreign_key "fighters", "contents"
  add_foreign_key "fighters", "price_tiers"
  add_foreign_key "petitions", "users"
  add_foreign_key "subscriptions", "fighters"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_likes", "contents"
  add_foreign_key "user_likes", "users"
end
