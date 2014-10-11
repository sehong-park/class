class DropTables < ActiveRecord::Migration
  def change
    drop_table :pictures
    drop_table :images
  end
end
