class AddAttachmentImageToPractices < ActiveRecord::Migration
  def self.up
    change_table :practices do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :practices, :image
  end
end
