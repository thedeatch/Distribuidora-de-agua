class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
      rename_column :drivers, :name, :first_name
      rename_column :drivers, :lastname, :last_name
  end

end
