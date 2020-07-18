class AddEnabledAndAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :enabled, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
