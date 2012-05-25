require 'omniauth-openid'
require 'openid/store/filesystem'

module Tauth
  class Engine < ::Rails::Engine
    isolate_namespace Tauth

    config.generators do |g|
      g.helper false
      g.assets false

      g.test_framework      :rspec, :view_specs => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'tauth.add_middleware', :after => 'build_middleware_stack' do
      OmniAuth::Strategies::OpenID::AX[:id]                = 'http://auth.annotation.jp/ax/id'
      OmniAuth::Strategies::OpenID::AX[:openid_identifier] = 'http://auth.annotation.jp/ax/openidUrl'
      OmniAuth::Strategies::OpenID::AX[:group_id]          = 'http://auth.annotation.jp/ax/groupId'
      OmniAuth::Strategies::OpenID::AX[:group_name]        = 'http://auth.annotation.jp/ax/groupName'
      OmniAuth::Strategies::OpenID::AX[:admin]             = 'http://auth.annotation.jp/ax/admin'

      OmniAuth.configure do |omniauth|
        omniauth.path_prefix = ''
      end

      config.middleware.use OmniAuth::Strategies::OpenID, {
        :name       => 'provider',
        :identifier => Tauth.config.discovery_url,
        :required   => OmniAuth::Strategies::OpenID::AX.values_at(:id, :email, :name, :openid_identifier, :group_id, :group_name, :admin),
        :optional   => [],
        :store      => OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
      }
    end

    initializer 'tauth' do
      Tauth.configure do |config|
        config.user_class ||= config.store_user ? Tauth::StoredUser : Tauth::User
      end

      ActiveSupport.on_load :action_controller do
        require 'tauth/controller_methods'
        ::ActionController::Base.send :include, ControllerMethods
      end
    end
  end
end
