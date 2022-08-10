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

ActiveRecord::Schema.define(version: 2022_08_10_212942) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "congressmen", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cod_register"
    t.string "cod_parliament"
    t.string "legislature"
    t.string "uf"
    t.string "party"
    t.string "cod_legislature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "congressman_id"
    t.string "cod_document"
    t.string "url_document"
    t.integer "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_documents_on_invoice_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "cod_sub_quota"
    t.text "description"
    t.string "num_specification_sub_quota"
    t.string "description_specification"
    t.integer "supplier_id", null: false
    t.integer "congressman_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congressman_id"], name: "index_expenses_on_congressman_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "num_invoice"
    t.string "document"
    t.datetime "issuance_date"
    t.decimal "brute_value", precision: 10, scale: 2
    t.decimal "gloss_value", precision: 10, scale: 2
    t.decimal "liquid_value", precision: 10, scale: 2
    t.string "month"
    t.string "year"
    t.string "num_quota"
    t.string "passenger"
    t.string "num_lot"
    t.string "patch"
    t.string "refund"
    t.string "restitution"
    t.integer "expense_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_invoices_on_expense_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "cpf_cnpj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "invoices"
  add_foreign_key "expenses", "congressmen"
  add_foreign_key "expenses", "suppliers"
  add_foreign_key "invoices", "expenses"
end
