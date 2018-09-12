class RemoveColumnsFromDriversTrucks < ActiveRecord::Migration[5.1]
  def change 
  	remove_column :drivers_trucks, :beginning_date, :date
  	remove_column :drivers_trucks, :ending_date, :date
  end
end
