class RemoveStdNumFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :std_num, :integer
  end
end
