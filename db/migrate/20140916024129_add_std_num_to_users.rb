class AddStdNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :std_num, :integer
  end
end
