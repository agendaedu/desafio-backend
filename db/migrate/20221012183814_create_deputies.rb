class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.text :name
      t.integer :unique_identifier
      t.integer :portfolio_number
      t.integer :legislature_number
      t.text :uf_acronym
      t.text :party_acronym
      t.integer :legislature_code
      t.integer :sub_quota_number
      t.text :sub_quota_description
      t.integer :subquota_specification_number
      t.text :subquota_specification_description

      t.timestamps
    end
  end
end
