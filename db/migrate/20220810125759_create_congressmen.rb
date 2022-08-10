class CreateCongressmen < ActiveRecord::Migration[6.0]
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :cpf, max_length: 16
      t.string :cod_register
      t.string :cod_parliament
      t.string :legislature
      t.string :uf
      t.string :party
      t.string :cod_legislature

      t.timestamps
    end
  end
end
