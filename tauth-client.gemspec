$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tauth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tauth-client'
  s.version     = Tauth::VERSION
  s.authors     = 'MicrobeDB.jp project'
  s.homepage    = 'https://auth.annotation.jp'
  s.summary     = 'TAuth Client Library'
  s.description = 'tauth-client provides authentication/authorization via TAuth.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 3.2.3'
  s.add_dependency 'mysql2'
  s.add_dependency 'omniauth-openid'
end
