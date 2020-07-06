class CreateExercise < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.text :wording
      t.text :solution

      t.timestamps
    end
  end
end
