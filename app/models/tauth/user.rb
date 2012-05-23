module Tauth
  if defined?(ActiveRecord)
    class User < ActiveRecord::Base
      attr_accessible :display_name, :email, :group_ids, :openid_identifier
    end
  elsif defined?(Mongoid)
    class User
      include Mongoid::Document

      identity :type => Integer

      field :display_name
      field :email
      field :group_ids
      field :openid_identifier

      class << self
        def find_or_initialize_by_id(id)
          find_or_initialize_by(:id => id)
        end
      end
    end
  end
end
