class AddColumnToOrders < ActiveRecord::Migration[5.1]
  def change 
    add_column :orders, :state, :string, default: "Pendiente"
  end
end