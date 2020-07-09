class CreateExam < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :title
      t.date :exam_date
      t.boolean :locked

      t.timestamps
    end

    create_table :exam_items do |t|
      t.belongs_to :exam
      t.belongs_to :exercise

      t.integer :position
    end
  end
end
