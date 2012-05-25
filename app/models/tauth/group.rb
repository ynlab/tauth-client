require 'active_attr'

module Tauth
  class Group
    include ActiveAttr::Model

    attribute :id
    attribute :name
  end
end