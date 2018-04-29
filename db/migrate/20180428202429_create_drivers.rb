class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :lastname
      t.date :birthday
      t.integer :income
      t.boolean :license
      t.integer :rut

      t.timestamps
    end
  end
end
