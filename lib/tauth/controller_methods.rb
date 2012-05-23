module Tauth
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :authenticated?
    end

    def login_as(user)
      cookies.permanent.signed[:tauth_user] = user.id
      @current_user = user
    end

    def logout
      cookies.delete(:tauth_user)
      @current_user = nil
    end

    def current_user
      if id = cookies.signed[:tauth_user]
        @current_user ||= Tauth.config.user_class.find(id)
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
