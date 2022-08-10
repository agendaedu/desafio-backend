class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :num_invoice
      t.string :document
      t.datetime :issuance_date
      t.decimal :brute_value, precision: 10, scale: 2
      t.decimal :gloss_value, precision: 10, scale: 2
      t.decimal :liquid_value, precision: 10, scale: 2
      t.string :month
      t.string :year
      t.string :num_quota
      t.string :passenger
      t.string :num_lot
      t.string :patch
      t.string :refund
      t.string :restitution
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
