class CreateExampleAnswers < ActiveRecord::Migration
  def change
    create_table :example_answers do |t|
      t.string :example_answer

      t.timestamps
    end
  end
end
