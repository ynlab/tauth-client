module Tauth
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :authenticated?
    end

    def login_as(user)
      cookies.permanent.signed[:tauth_user] = {:value => user.attributes}
      @current_user = user
    end

    def logout
      cookies.delete(:tauth_user)
      @current_user = nil
    end

    def current_user
      return unless attrs = cookies.signed[:tauth_user]

      if Tauth.config.store_user
        @current_user ||= Tauth.config.user_class.find(attrs['id'])
      else
        @current_user ||= Tauth.config.user_class.new(attrs)
      end
    rescue ActiveRecord::RecordNotFound
      logout
    end

    def authenticated?
      !!current_user
    end

    def authenticate!
      redirect_to '/auth/provider' unless authenticated?
    end
  end
end
