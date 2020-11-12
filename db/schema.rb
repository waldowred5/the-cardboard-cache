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

ActiveRecord::Schema.define(version: 2020_11_12_035216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.text "street_1"
    t.text "street_2"
    t.text "post_code"
    t.text "city"
    t.text "state"
    t.text "country"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "board_games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name"
    t.integer "year_published"
    t.integer "overall_rank"
    t.float "geek_rating"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playing_time"
    t.integer "max_playing_time"
    t.integer "age"
    t.float "weight"
    t.text "long_description"
    t.text "image"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owned_game_id", null: false
    t.text "image_url"
    t.index ["owned_game_id"], name: "index_images_on_owned_game_id"
  end

  create_table "owned_games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trader_id", null: false
    t.bigint "board_game_id", null: false
    t.integer "priority"
    t.integer "trade_status"
    t.decimal "price"
    t.integer "condition"
    t.index ["board_game_id"], name: "index_owned_games_on_board_game_id"
    t.index ["trader_id"], name: "index_owned_games_on_trader_id"
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "requestor_id", null: false
    t.bigint "requestee_id", null: false
    t.bigint "requestor_board_game_id", null: false
    t.bigint "requestee_board_game_id", null: false
    t.datetime "requestor_accepted_at"
    t.datetime "requestee_accepted_at"
    t.datetime "traded_at"
    t.datetime "cancelled_at"
    t.index ["requestee_board_game_id"], name: "index_trades_on_requestee_board_game_id"
    t.index ["requestee_id"], name: "index_trades_on_requestee_id"
    t.index ["requestor_board_game_id"], name: "index_trades_on_requestor_board_game_id"
    t.index ["requestor_id"], name: "index_trades_on_requestor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "username"
    t.text "first_name"
    t.text "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wished_games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wishlister_id", null: false
    t.bigint "board_game_id", null: false
    t.integer "priority"
    t.index ["board_game_id"], name: "index_wished_games_on_board_game_id"
    t.index ["wishlister_id"], name: "index_wished_games_on_wishlister_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "images", "owned_games"
  add_foreign_key "owned_games", "board_games"
  add_foreign_key "owned_games", "users", column: "trader_id"
  add_foreign_key "trades", "board_games", column: "requestee_board_game_id"
  add_foreign_key "trades", "board_games", column: "requestor_board_game_id"
  add_foreign_key "trades", "users", column: "requestee_id"
  add_foreign_key "trades", "users", column: "requestor_id"
  add_foreign_key "wished_games", "board_games"
  add_foreign_key "wished_games", "users", column: "wishlister_id"
end
