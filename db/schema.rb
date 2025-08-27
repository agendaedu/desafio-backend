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

ActiveRecord::Schema.define(version: 2022_10_16_041025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deputies", force: :cascade do |t|
    t.text "name"
    t.integer "unique_identifier"
    t.integer "portfolio_number"
    t.integer "legislature_number"
    t.text "uf_acronym"
    t.text "party_acronym"
    t.integer "legislature_code"
    t.integer "sub_quota_number"
    t.text "sub_quota_description"
    t.integer "subquota_specification_number"
    t.text "subquota_specification_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
  end

  create_table "fiscal_documents", force: :cascade do |t|
    t.text "supplier"
    t.text "cnpj"
    t.text "cpf"
    t.string "document_number"
    t.text "document_type"
    t.datetime "issue_date"
    t.float "gloss_value"
    t.float "net_value"
    t.text "month"
    t.integer "year"
    t.integer "installment_number"
    t.text "passenger"
    t.text "segment"
    t.integer "lot_number"
    t.integer "reinbursement_number"
    t.float "refund_amount"
    t.bigint "deputy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "document_url"
    t.index ["deputy_id"], name: "index_fiscal_documents_on_deputy_id"
  end

  add_foreign_key "fiscal_documents", "deputies"
end
