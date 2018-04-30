class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :detail
      t.integer :price
      t.integer :product_number
      t.integer :stock

      t.timestamps
    end
  end
end
