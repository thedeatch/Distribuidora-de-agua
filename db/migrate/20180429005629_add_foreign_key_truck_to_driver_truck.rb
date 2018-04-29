class AddForeignKeyTruckToDriverTruck < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :driver_trucks, :trucks, column: :truck_id, primary: :id
  end
end
