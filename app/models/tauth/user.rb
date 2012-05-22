module Tauth
  class User < ActiveRecord::Base
    attr_accessible :display_name, :email, :group_ids
  end
end
