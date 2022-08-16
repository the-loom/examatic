class CreateSubject < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.timestamps
    end

    create_table :memberships do |t|
      t.integer :subject_id
      t.integer :user_id
      t.timestamps
    end

    add_column :exams, :subject_id, :integer
    add_column :exercises, :subject_id, :integer
  end
end
