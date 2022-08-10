class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :cpf_cnpj, max_length: 20

      t.timestamps
    end
  end
end
