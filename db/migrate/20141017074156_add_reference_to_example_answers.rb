class AddReferenceToExampleAnswers < ActiveRecord::Migration
  def change
    add_column :example_answers, :practice_id, :integer
    add_index :example_answers, :practice_id
  end
end
