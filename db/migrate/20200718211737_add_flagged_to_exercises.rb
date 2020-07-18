class AddFlaggedToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :flagged, :boolean, default: false
  end
end
