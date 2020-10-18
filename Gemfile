source 'https://rubygems.org'

gem 'active_model_serializers', '~> 0.10.0'
gem 'aws-sdk-rails'
gem 'aws-sdk-s3', '~> 1.0'
gem 'bootsnap', require: false
gem 'data_migrate'
gem 'devise'
gem 'devise-i18n'
gem 'devise_token_auth'
gem 'draper', '~> 3.1'
gem 'enumerize'
gem 'jbuilder', '~> 2.7'
gem 'omniauth-google-oauth2'
gem 'pg'
gem 'power-types'
gem 'puma', '~> 4.1'
gem 'pundit'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'rails-i18n'
gem 'recipient_interceptor'
gem 'responders'
gem 'sass-rails', '>= 6'
gem 'sidekiq'
gem 'simple_token_authentication', '~> 1.0'
gem 'strong_migrations'
gem 'turbolinks', '~> 5'
gem 'versionist'
gem 'webpacker', '~> 4.0'

group :development do
  gem 'annotate', '~> 3.0'
  gem 'letter_opener'
  gem 'listen'
  gem 'spring'
end

group :linter do
  gem 'brakeman', require: false
  gem 'fasterer', require: false
  gem 'pronto'
  gem 'pronto-brakeman', require: false
  gem 'pronto-fasterer', require: false
  gem 'pronto-rubocop', require: false
  gem 'pronto-scss', require: false
  gem 'pronto-eslint', require: false
  gem 'rubocop', '~> 0.82.0'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'scss_lint', require: false
end

group :production do
  gem 'heroku-stage'
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end

group :test do
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :production, :development, :test do
  gem 'tzinfo-data'
end
