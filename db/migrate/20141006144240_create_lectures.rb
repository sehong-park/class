class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :instructor

      t.timestamps
    end
  end
end
