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

ActiveRecord::Schema[7.0].define(version: 2023_09_26_094841) do
  create_table "incomes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "amount_price"
    t.string "bank_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", charset: "utf8mb4", force: :cascade do |t|
    t.string "payment"
    t.bigint "income_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_id"], name: "index_settlements_on_income_id"
  end

  create_table "spendings", charset: "utf8mb4", force: :cascade do |t|
    t.integer "price", null: false
    t.string "item_name", null: false
    t.bigint "settlement_id", null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["settlement_id"], name: "index_spendings_on_settlement_id"
  end

  add_foreign_key "settlements", "incomes"
  add_foreign_key "spendings", "settlements"
end
