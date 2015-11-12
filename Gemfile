source 'https://rubygems.org'
ruby '2.2.3'

gem 'pry'
gem 'puma', group: :rackup

group :app do
  gem 'sinatra'
  gem 'slim'
  gem 'sprockets-helpers'
  gem 'kramdown'
end

group :assets do
  gem 'sprockets'
  gem 'sass'
  gem 'bootstrap-sass'
  gem 'uglifier'
end

group :development, :test do
  gem 'rake'
  gem 'shotgun'
  gem 'rspec'
  gem 'rack-test'
  gem 'guard', require: false
  gem 'guard-rspec', require: false
end

# vi: syntax=ruby
