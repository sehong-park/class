class AddTimestampToMaterials < ActiveRecord::Migration
  def change
    change_table :materials do |t|
      t.timestamps
    end
    
    add_index :materials, :created_at
  end
end
