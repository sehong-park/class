class RemoveColFromExampleAnswers < ActiveRecord::Migration
  def change
    remove_column :example_answers, :updated_at
    remove_column :example_answers, :created_at
  end
end
