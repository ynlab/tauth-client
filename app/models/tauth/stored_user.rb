module Tauth
  class StoredUser < ActiveRecord::Base
    self.table_name = 'tauth_users'

    attr_accessible :display_name, :email, :group_ids, :openid_identifier
  end
end
