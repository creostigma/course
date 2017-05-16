class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :pharmacy, index: true, foreign_key: true, null: false
      t.references :medicine, index: true, foreign_key: true, null: false
      t.integer :amount, null: false

      t.timestamps null: false
    end
    add_index :information, [:pharmacy_id, :medicine_id], :unique => true
  end
end
