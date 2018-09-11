class ChangeColumnToTrucks < ActiveRecord::Migration[5.1]
  def self.up
    change_column :trucks, :detail, :string, default: "Operativo"
  end

  def self.down
    change_column :trucks, :detail, :string      
  end
end
