class AddDayToDriverTrucks < ActiveRecord::Migration[5.1]
  def change 
  	add_column :driver_trucks, :day, :date
  end
end
