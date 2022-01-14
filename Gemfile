# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# rails
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

# magnetis open source gems
gem 'caze'

# server
gem 'puma', '~> 5.5'

# assets
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'

# db
gem 'connection_pool', '~> 2.2'
gem 'pg', '~> 1.2'

# encryptation
gem 'bcrypt', '~> 3.1.7'

# utils
gem 'bootsnap', '>= 1.4.4', require: false
gem 'nokogiri', '~> 1.13.1', require: false
gem 'rexml', '~> 3.2', '>= 3.2.4'

# tracing
gem 'honeycomb-beeline'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'reek'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'faker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener_web'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'email_spec'
  gem 'rails-controller-testing'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-collection_matchers'
  gem 'rspec-mocks'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.5', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'valid_attribute', '~> 2.0.0'
  gem 'webdrivers'
end
