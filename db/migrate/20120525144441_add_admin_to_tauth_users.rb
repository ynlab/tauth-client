class AddAdminToTauthUsers < ActiveRecord::Migration
  def change
    add_column :tauth_users, :admin, :boolean, :null => false, :default => false
  end
end
