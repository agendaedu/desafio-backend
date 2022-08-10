class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :cod_sub_quota
      t.text :description
      t.string :num_specification_sub_quota
      t.string :description_specification
      t.references :supplier, null: false, foreign_key: true
      t.references :congressman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
