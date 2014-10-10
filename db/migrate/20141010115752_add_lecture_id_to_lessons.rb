class AddLectureIdToLessons < ActiveRecord::Migration
  def change
    add_reference :lessons, :lecture, index: true
  end
end
