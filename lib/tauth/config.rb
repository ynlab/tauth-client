require 'active_support/configurable'

module Tauth
  class << self
    def configure(&block)
      yield @config ||= Tauth::Configuration.new
    end

    attr_reader :config
  end

  class Configuration
    include ActiveSupport::Configurable

    config_accessor :user_class
  end
end
