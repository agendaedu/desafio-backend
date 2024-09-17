class AddSupplierToExpenditures < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenditures, :supplier, foreign_key: true
  end
end
