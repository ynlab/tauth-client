class ChangeTauthUsersGroupIdsToGroupsData < ActiveRecord::Migration
  def up
    remove_column :tauth_users, :group_ids
    add_column    :tauth_users, :groups_data, :text
  end

  def down
    remove_column :tauth_users, :groups_data
    add_column    :tauth_users, :group_ids, :string
  end
end
