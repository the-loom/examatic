class DropFieldsForExercise < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :wording
    remove_column :exercises, :solution
  end
end
