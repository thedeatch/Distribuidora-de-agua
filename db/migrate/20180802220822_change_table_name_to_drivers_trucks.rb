class ChangeTableNameToDriversTrucks < ActiveRecord::Migration[5.1]
  def change 
  	rename_table :driver_trucks, :drivers_trucks 
  end
end
