class ChangePhoneTypeInClients < ActiveRecord::Migration[5.1]
  def self.up
    change_column :clients, :phone, :string
  end

  def self.down
    change_column :clients, :phone, :integer
  end
end
