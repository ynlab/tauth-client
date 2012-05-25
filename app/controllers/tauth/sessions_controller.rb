module Tauth
  class SessionsController < ApplicationController
    AX = OmniAuth::Strategies::OpenID::AX

    skip_before_filter :refresh_current_user

    def new
      redirect_to URI::Generic.build(
        :path  => root_path + 'provider',
        :query => Rack::Utils.build_query(:return_to => params[:return_to] || request.referer)
      ).to_s
    end

    def create
      ax = OpenID::AX::FetchResponse.from_success_response(auth_hash[:extra][:response])

      id          = ax.get_single(AX[:id])
      groups_data = ax.get(AX[:group_id]).map(&:to_i).zip(ax.get(AX[:group_name]))

      attrs = {
        :display_name      => auth_hash[:info][:name],
        :email             => auth_hash[:info][:email],
        :openid_identifier => ax.get_single(AX[:openid_identifier]),
        :groups_data       => groups_data
      }

      if Tauth.config.store_user
        user = Tauth.config.user_class.find_or_initialize_by_id(id)

        user.update_attributes!(attrs)
      else
        user = Tauth.config.user_class.new(attrs.merge(:id => id))
      end

      login_as user

      redirect_to params[:return_to] || main_app.root_path
    end

    def destroy
      logout

      redirect_to main_app.root_path
    end

    def failure
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
