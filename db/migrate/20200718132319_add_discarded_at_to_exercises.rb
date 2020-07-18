class AddDiscardedAtToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :discarded_at, :datetime
    add_index :exercises, :discarded_at
  end
end
