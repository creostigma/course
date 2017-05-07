class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.integer :number, null: false, uniqueness: true
      t.string :address, null: false, uniqueness: true
      t.string :subway

      t.timestamps null: false
    end
  end
end
