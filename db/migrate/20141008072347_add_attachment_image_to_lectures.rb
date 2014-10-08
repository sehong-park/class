class AddAttachmentImageToLectures < ActiveRecord::Migration
  def self.up
    change_table :lectures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lectures, :image
  end
end
