require 'active_attr'

module Tauth
  class User
    include ActiveAttr::Model

    attribute :id,                :type => Integer
    attribute :display_name,      :type => String
    attribute :email,             :type => String
    attribute :group_ids,         :type => String
    attribute :openid_identifier, :type => String
  end
end
