class AddAttachmentImageToTeachingMaterials < ActiveRecord::Migration
  def self.up
    change_table :teaching_materials do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teaching_materials, :image
  end
end
