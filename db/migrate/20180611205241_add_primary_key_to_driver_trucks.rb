class AddPrimaryKeyToDriverTrucks < ActiveRecord::Migration[5.1]
  def change 
  	add_column :driver_trucks, :id, :primary_key
  end
end
