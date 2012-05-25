require 'active_attr'

module Tauth
  class User
    include ActiveAttr::Model

    attribute :id,                :type => Integer
    attribute :display_name,      :type => String
    attribute :email,             :type => String
    attribute :openid_identifier, :type => String
    attribute :groups_data,       :type => Array

    def groups
      Array.wrap(groups_data).map {|id, name|
        Group.new(:id => id, :name => name)
      }
    end
  end
end
