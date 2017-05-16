class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.integer :number, null: false
      t.string :address, null: false
      t.string :subway

      t.timestamps null: false
    end
    add_index :pharmacies, :number, :unique => true
    add_index :pharmacies, :address, :unique => true
  end
end
