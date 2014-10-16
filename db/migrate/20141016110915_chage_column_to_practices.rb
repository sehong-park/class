class ChageColumnToPractices < ActiveRecord::Migration
  def change
    remove_column :practices, :question
    add_column :practices, :question, :string
  end
end
