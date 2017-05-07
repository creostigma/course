class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name, null: false
      t.float :max_count, null: false
      t.string :notation, null: false
      t.integer :count, null: false
      t.string :manufacturer, null: false
      t.integer :perm, null: false
      t.float :price, null: false, scale: 2

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE medicines ADD CONSTRAINT check_num
        CHECK (max_count > 0 AND price > 0 AND count > 0)"

        execute "ALTER TABLE medicines ADD CONSTRAINT check_var
        CHECK ((perm = 1 OR perm = 2) AND (notation = 'number' OR notation = 'volume'))"
      end

      dir.down do
        execute "ALTER TABLE medicines DROP CONSTRAINT check_num"
        execute "ALTER TABLE medicines DROP CONSTRAINT check_var"
      end
    end

  end
end
