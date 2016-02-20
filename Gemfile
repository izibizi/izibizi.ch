source 'https://rubygems.org'
ruby '2.3.0'

gem 'pry'
gem 'puma', group: :rackup

group :app do
  gem 'sinatra'
  gem 'slim'
  gem 'sprockets-helpers'
  gem 'kramdown'
  gem 'httparty'
end

group :assets do
  gem 'sprockets'
  gem 'sass'
  gem 'bootstrap-sass'
  gem 'uglifier'
  gem 'therubyracer', platforms: :ruby
end

group :development, :test do
  gem 'rake'
  gem 'shotgun'
  gem 'rspec'
  gem 'guard', require: false
  gem 'guard-rspec', require: false
end

group :test do
  gem 'rack-test'
  gem 'webmock'
end

# vi: syntax=ruby
