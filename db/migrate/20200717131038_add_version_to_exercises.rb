class AddVersionToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :version, :integer, default: 1
    add_reference :exercises, :origin, index: true
    add_foreign_key :exercises, :exercises, column: :origin_id
  end
end
