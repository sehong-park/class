class AddLevelToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :level, :integer
  end
end
