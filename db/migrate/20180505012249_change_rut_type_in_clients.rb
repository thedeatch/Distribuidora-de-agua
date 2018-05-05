class ChangeRutTypeInClients < ActiveRecord::Migration[5.1]
  def self.up
    change_column :clients, :rut, :string
  end

  def self.down
    change_column :clients, :rut, :integer      
  end
end
