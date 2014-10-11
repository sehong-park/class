class DropTable < ActiveRecord::Migration
  def change
    drop_table :teaching_materials
  end
end
