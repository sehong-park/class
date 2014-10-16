class AddIndexToPractices < ActiveRecord::Migration
  def change
    add_index :practices, [:lesson_id, :created_at]
  end
end
