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

ActiveRecord::Schema.define(version: 2022_07_29_160441) do

  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comment_replies", charset: "utf8", force: :cascade do |t|
    t.string "text"
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_replies_on_comment_id"
    t.index ["user_id"], name: "index_comment_replies_on_user_id"
  end

  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id"
    t.bigint "room_id"
    t.integer "standing_position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_comments_on_room_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "issue_comments", charset: "utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "issue_id"
    t.bigint "user_id"
    t.integer "standing_position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_issue_comments_on_issue_id"
    t.index ["user_id"], name: "index_issue_comments_on_user_id"
  end

  create_table "issue_likes", charset: "utf8", force: :cascade do |t|
    t.bigint "issue_comment_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_comment_id"], name: "index_issue_likes_on_issue_comment_id"
    t.index ["user_id"], name: "index_issue_likes_on_user_id"
  end

  create_table "issues", charset: "utf8", force: :cascade do |t|
    t.string "issue_title", null: false
    t.bigint "room_id"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_issues_on_owner_id"
    t.index ["room_id"], name: "index_issues_on_room_id"
  end

  create_table "likes", charset: "utf8", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "positions", charset: "utf8", force: :cascade do |t|
    t.bigint "user_room_id"
    t.integer "standing_position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_room_id"], name: "index_positions_on_user_room_id"
  end

  create_table "relationships", charset: "utf8", force: :cascade do |t|
    t.integer "following_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
  end

  create_table "room_tags", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_tags_on_room_id"
    t.index ["tag_id"], name: "index_room_tags_on_tag_id"
  end

  create_table "rooms", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "owner_id"
    t.datetime "deadline", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
  end

  create_table "tags", charset: "utf8", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_rooms", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
    t.index ["user_id", "room_id"], name: "index_user_rooms_on_user_id_and_room_id", unique: true
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "profile"
    t.integer "sex_id"
    t.date "birthday"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_replies", "comments"
  add_foreign_key "comment_replies", "users"
  add_foreign_key "comments", "rooms"
  add_foreign_key "comments", "users"
  add_foreign_key "issue_comments", "issues"
  add_foreign_key "issue_comments", "users"
  add_foreign_key "issue_likes", "issue_comments"
  add_foreign_key "issue_likes", "users"
  add_foreign_key "issues", "rooms"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "positions", "user_rooms"
  add_foreign_key "room_tags", "rooms"
  add_foreign_key "room_tags", "tags"
  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users"
end
