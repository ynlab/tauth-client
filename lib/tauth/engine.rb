require 'omniauth-openid'
require 'openid/store/filesystem'

module Tauth
  class Engine < ::Rails::Engine
    isolate_namespace Tauth

    config.generators do |g|
      g.test_framework      :rspec, :view_specs => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'tauth.add_middleware', :after => 'build_middleware_stack' do
      OmniAuth.configure do |omniauth|
        omniauth.path_prefix = ''
      end

      config.middleware.use OmniAuth::Strategies::OpenID, {
        :name       => 'provider',
        :identifier => 'https://www.google.com/accounts/o8/id',
        :store      => OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
      }
    end
  end
end
