class CreateMedicineCategories < ActiveRecord::Migration
  def change
    create_table :medicine_categories do |t|
      t.references :medicine, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :medicine_categories, [:medicine_id, :category_id], :unique => true
  end
end
