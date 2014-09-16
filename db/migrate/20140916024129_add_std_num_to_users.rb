class AddStdNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :std_num, :integer
    add_index :users, :std_num, unique: true
  end
end
