class ChangeRoleToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_column :users, :role, :string, default: "admin"
  end

  def self.down
    change_column :users, :role, :string, default: "employee"
  end
end
