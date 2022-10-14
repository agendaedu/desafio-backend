class CreateFiscalDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :fiscal_documents do |t|
      t.text :supplier
      t.text :cnpj
      t.text :cpf
      t.integer :document_number
      t.text :document_type
      t.datetime :issue_date
      t.float :gloss_value
      t.float :net_value
      t.text :month
      t.integer :year
      t.integer :installment_number
      t.text :passenger
      t.text :segment
      t.integer :lot_number
      t.integer :reinbursement_number
      t.float :refund_amount
      t.references :deputy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
