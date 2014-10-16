class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.integer :lesson_id
      t.text :question
      t.string :right_answer

      t.timestamps
    end
  end
end
