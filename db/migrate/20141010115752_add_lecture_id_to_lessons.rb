class AddLectureIdToLessons < ActiveRecord::Migration
  def change
    add_reference :Lessons, :lecture, index: true
  end
end
