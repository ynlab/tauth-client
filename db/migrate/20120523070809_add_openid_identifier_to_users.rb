class AddOpenidIdentifierToUsers < ActiveRecord::Migration
  def change
    add_column :tauth_users, :openid_identifier, :string
  end
end
