class AddToDuputyMaiorDespesa < ActiveRecord::Migration[6.0]
  def change
    add_column :deputies, :maior_despesa, :float
  end
end
