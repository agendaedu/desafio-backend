class CreateDeputy < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string  :tx_nome_parlamentar
      t.integer :id_cadastro
      t.string  :cpf
      t.string  :sg_uf
      t.timestamps
    end
  end
end
