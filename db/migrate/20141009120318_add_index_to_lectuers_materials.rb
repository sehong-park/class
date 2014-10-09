class AddIndexToLectuersMaterials < ActiveRecord::Migration
  def change
    add_index :lectures_materials, [:lecture_id, :material_id]
  end
end
