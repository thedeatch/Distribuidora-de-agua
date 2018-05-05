class ChangeRutTypeInDrivers < ActiveRecord::Migration[5.1]
  def self.up
    change_column :drivers, :rut, :string
  end

  def self.down
    change_column :drivers, :rut, :integer
  end
end
