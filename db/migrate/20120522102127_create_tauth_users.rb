class CreateTauthUsers < ActiveRecord::Migration
  def change
    create_table :tauth_users do |t|
      t.string :email
      t.string :display_name
      t.string :group_ids

      t.timestamps
    end
  end
end
