class DropCLientsTable < ActiveRecord::Migration[5.1]
  def change
      drop_table :c_lients
  end
end
