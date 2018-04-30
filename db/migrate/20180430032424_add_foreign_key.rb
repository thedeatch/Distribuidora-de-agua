class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
      add_foreign_key :orders, :clients, column: :client_id, primary:  :id
      add_foreign_key :orders, :products, column: :product_id, primary: :id
      add_foreign_key :orders, :trucks, column: :truck_id, primary: :id
  end
end
