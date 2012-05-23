module Tauth
  class StoredUser < ActiveRecord::Base
    attr_accessible :display_name, :email, :group_ids, :openid_identifier
  end
end
