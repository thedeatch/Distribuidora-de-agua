class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.datetime :delivery_date
      t.integer :amount
      t.integer :client_id
      t.integer :truck_id
      t.integer :product_id

      t.timestamps
    end
  end
end
