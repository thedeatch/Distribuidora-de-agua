class AddEndingDateToDriversTrucks < ActiveRecord::Migration[5.1]
  def change 
    add_column :drivers_trucks, :ending_date, :date  	
  end
end
