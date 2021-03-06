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

ActiveRecord::Schema.define(version: 20170113183004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stripe_user_accounts", force: :cascade do |t|
    t.string "stripe_user_id"
    t.json   "balance"
    t.json   "charges"
    t.json   "disputes"
    t.json   "refunds"
    t.json   "subscriptions"
    t.json   "transfers"
    t.json   "bank_accounts"
    t.json   "orders"
    t.json   "returns"
    t.json   "payment_methods"
  end

  create_table "users", force: :cascade do |t|
    t.string "access_token"
    t.string "refresh_token"
    t.string "stripe_publishable_key"
    t.string "stripe_user_id"
    t.string "account_scope"
  end

end
