class CreateFileCeap < ActiveRecord::Migration[6.0]
  def change
    create_table :file_ceaps do |t|
      t.timestamps
      t.integer :status, default: 0
      t.string :title
    end
  end
end
