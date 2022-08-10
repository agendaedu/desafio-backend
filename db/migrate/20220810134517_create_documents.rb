class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :congressman_id, max_length: 20
      t.string :cod_document, max_length: 20
      t.string :url_document
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
