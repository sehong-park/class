class AddDescriptionToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :description, :string
  end
end
