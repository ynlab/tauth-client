module Tauth
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :authenticated?, :refresh_current_user!

      before_action :refresh_current_user, :if => :authenticated?
    end

    def login_as(user)
      cookies.permanent.signed[:tauth_user]       = {:value => user.attributes}
      cookies.permanent.signed[:tauth_last_fetch] = Time.zone.now

      @current_user = user
    end

    def logout
      cookies.delete :tauth_user
      cookies.delete :tauth_last_fetch

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
      redirect_to tauth.login_path(:return_to => request.fullpath) unless authenticated?
    end

    def refresh_current_user
      return if (last_fetch = cookies.signed[:tauth_last_fetch] and last_fetch > Tauth.config.expires_in.ago)

      refresh_current_user!
    end

    def refresh_current_user!
      redirect_to tauth.login_path(:return_to => request.fullpath)
    end
  end
end
