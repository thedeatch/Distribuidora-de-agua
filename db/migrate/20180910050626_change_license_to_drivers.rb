class ChangeLicenseToDrivers < ActiveRecord::Migration[5.1]
  def self.up
    change_column :drivers, :license, :boolean, default: "true"
  end

  def self.down
    change_column :drivers, :license, :boolean      
  end
end
