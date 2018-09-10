class RemoveColumnToProducts < ActiveRecord::Migration[5.1]
  def change 
  	remove_column :products, :liters, :float
  end
end
