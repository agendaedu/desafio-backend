class AddDocumentUrlColumnToFiscalDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :fiscal_documents, :document_url, :string
  end
end
