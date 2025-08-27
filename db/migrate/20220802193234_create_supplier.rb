class CreateSupplier < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :txt_fornecedor
      t.string :txt_cnpj_cpf
      t.timestamps
    end
  end
end
