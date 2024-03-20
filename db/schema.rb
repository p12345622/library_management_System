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

ActiveRecord::Schema.define(version: 2022_03_28_123751) do

  # These are extensions that must be enabled in order to support this database
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

  create_table "add_data_to_book_issues", force: :cascade do |t|
    t.string "token"
    t.string "charge_id"
    t.string "error_message"
    t.string "customer_id"
    t.integer "payment_gateway"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_issues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "issue_date"
    t.datetime "submit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "day"
    t.datetime "date"
    t.integer "status"
    t.integer "total_day"
    t.integer "total_fine"
    t.string "token"
    t.string "charge_id"
    t.string "error_message"
    t.string "customer_id"
    t.integer "payment_gateway"
    t.index ["book_id"], name: "index_book_issues_on_book_id"
    t.index ["user_id"], name: "index_book_issues_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.bigint "price"
    t.string "author"
    t.string "book_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "image"
    t.integer "Total", default: 100
    t.integer "bookcollection"
    t.integer "quantity"
    t.integer "category_id"
    t.string "stripe_p_name"
    t.string "paypal_p_name"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "query"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "password_hash"
    t.integer "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submit_books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "submit_date"
  end

  create_table "total_books", force: :cascade do |t|
    t.bigint "book_issue_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_total_books_on_book_id"
    t.index ["book_issue_id"], name: "index_total_books_on_book_issue_id"
  end

  create_table "total_fines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid"
    t.string "token"
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book"
    t.integer "no"
    t.string "User_name"
    t.integer "role", default: 0
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_last"
    t.integer "card_exp_month"
    t.integer "card_type"
    t.integer "card_exp_year"
    t.boolean "subscription"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "welcomes", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_issues", "books"
  add_foreign_key "book_issues", "users"
  add_foreign_key "total_books", "book_issues"
  add_foreign_key "total_books", "books"
end
