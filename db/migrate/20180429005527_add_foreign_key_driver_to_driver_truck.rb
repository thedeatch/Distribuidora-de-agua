class AddForeignKeyDriverToDriverTruck < ActiveRecord::Migration[5.1]
  def change
      add_foreign_key :driver_trucks, :drivers, column: :driver_id, primary: :id
  end
end
