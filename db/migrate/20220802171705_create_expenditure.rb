class CreateExpenditure < ActiveRecord::Migration[6.0]
  def change
    create_table :expenditures do |t|
      t.string :txt_fornecedor
      t.float  :vlr_liquido, precision: 5, scale: 2
      t.date   :data_emissao
      t.string :url_documento
      t.string :descricao
      t.belongs_to :deputy
      t.timestamps
    end
  end
end
