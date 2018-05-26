class AddLitersToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :liters, :float
  end
end
