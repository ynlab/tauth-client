source 'http://rubygems.org'

# Declare your gem's dependencies in tauth.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# the dummy application
gem 'jquery-rails'
gem 'haml-rails'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  group :test do
    gem 'tapp'
  end
end

group :test do
  gem 'factory_girl_rails', '~> 1.7.0'

  group :development do
    gem 'rspec-rails'
  end
end
