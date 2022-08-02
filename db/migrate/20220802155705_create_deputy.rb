class CreateDeputy < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string  :txNomeParlamentar
      t.integer :ideCadastro
      t.string  :cpf
      t.string  :sgUF
      t.timestamps
    end
  end
end
