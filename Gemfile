source 'https://rubygems.org'

gem 'rails', '4.1.0'

gem 'i18n'
gem 'globalize'

group :assets do
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 4.0.3'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
  gem 'compass-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'bootstrap-sass', '~> 3.2.0'
end

group :test do
  gem 'sqlite3'
  gem 'rspec'
end

group :development do
  gem 'sqlite3'
  gem 'quiet_assets'
end

group :production do
  gem 'pg'
end

#todo: remove it for production
gem "better_errors"
gem "binding_of_caller"
gem 'pony', github: 'benprew/pony'

group :production do
  gem 'rails_12factor'
end

gem "slim-rails"
gem "jquery-rails"
gem 'simple_form'

gem 'activeadmin', github: 'activeadmin'
# gem 'country_select'
gem 'devise'
gem 'cancan'
gem 'protected_attributes'

#ckeditor + additions for rails
# goto master after this fixed: https://github.com/bastiaanterhorst/rich/issues/162
gem 'rich', github: 'bastiaanterhorst/rich', ref: 'a3b4fcccf22788763b44dc732acce6547e0380a4'


gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '~> 1.5.7'

gem 'mandrill-api'

gem 'unicorn'

#crud actions for controllers
gem 'inherited_resources'
gem 'responders'


gem 'awesome_nested_fields'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

ruby '3.1.0'
