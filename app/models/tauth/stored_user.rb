module Tauth
  class StoredUser < ActiveRecord::Base
    self.table_name = 'tauth_users'

    attr_accessible :display_name, :email, :openid_identifier, :groups_data

    serialize :groups_data

    def groups
      Array.wrap(groups_data).map {|id, name|
        Group.new(:id => id, :name => name)
      }
    end
  end
end
