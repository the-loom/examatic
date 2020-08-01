class AddNumberToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :internal_id, :integer, default: 0

    execute <<-SQL
      update exercises
      set internal_id = id
    SQL
  end
end
