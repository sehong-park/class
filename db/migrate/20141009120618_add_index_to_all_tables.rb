class AddIndexToAllTables < ActiveRecord::Migration
  def change
    add_index :users, [:created_at, :updated_at]
    add_index :organizations, [:name, :created_at]
    add_index :materials, [:name]
    add_index :lectures, [:name, :instructor, :level, :created_at]
    add_index :courses, :created_at
  end
end
