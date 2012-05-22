module Tauth
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :authenticated?
    end

    def login_as(user)
      session[:current_user] = user.id
      @current_user = user
    end

    def logout
      @current_user = nil
      reset_session
    end

    def current_user
      if id = session[:current_user]
        @current_user ||= User.find(id)
      end
    end

    def authenticated?
      !!current_user
    end

    def authenticate!
      redirect_to '/auth/provider' unless authenticated?
    end
  end
end
