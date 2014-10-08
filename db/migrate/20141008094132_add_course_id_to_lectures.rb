class AddCourseIdToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :course_id, :integer
    add_index :lectures, :course_id
  end
end
