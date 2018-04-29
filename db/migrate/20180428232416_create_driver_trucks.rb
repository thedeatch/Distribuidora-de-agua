class CreateDriverTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :driver_trucks, :id => false do |t|
      t.integer :driver_id
      t.integer :truck_id

      t.timestamps
    end
  end
end
