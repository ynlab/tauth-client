require 'active_support/configurable'
require 'active_support/core_ext/numeric/time'

module Tauth
  class << self
    def configure(&block)
      yield @config ||= Tauth::Configuration.new
    end

    attr_reader :config
  end

  class Configuration
    include ActiveSupport::Configurable

    config_accessor :discovery_url
    config_accessor :store_user
    config_accessor :user_class
    config_accessor :expires_in
  end

  configure do |config|
    config.discovery_url = 'http://localhost:3333/server'
    config.store_user    = false
    config.expires_in    = 5.minutes
  end
end
