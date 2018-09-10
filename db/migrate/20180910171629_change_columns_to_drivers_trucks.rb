class ChangeColumnsToDriversTrucks < ActiveRecord::Migration[5.1]
  def change 
  	rename_column :drivers_trucks, :day, :beginning_date
  end
end
