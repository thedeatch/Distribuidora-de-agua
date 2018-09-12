class AddDaytoDriversTrucks < ActiveRecord::Migration[5.1]
  def change 
    add_column :drivers_trucks, :assignment_date, :date  	
  end
end
