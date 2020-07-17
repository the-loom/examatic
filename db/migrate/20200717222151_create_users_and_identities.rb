class CreateUsersAndIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email

      t.references :user
      t.timestamps
    end
  end
end
