class AddCpfColumnToDeputy < ActiveRecord::Migration[6.0]
  def change
    add_column :deputies, :cpf, :string
  end
end
