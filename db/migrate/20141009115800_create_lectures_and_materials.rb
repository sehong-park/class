class CreateLecturesAndMaterials < ActiveRecord::Migration
  def change
    create_table :lectures_materials do |t|
      t.belongs_to :lecture
      t.belongs_to :material
    end
  end
end
