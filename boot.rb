require 'yaml'
require 'json'

require 'bundler'
Bundler.require(:default, :app, ENV['RACK_ENV'].to_sym)
require './config/sprockets'

configure do
  set :production, ENV['RACK_ENV'].eql?('production')
  set :app_root, File.expand_path('..', __FILE__)
  set :views, File.join(settings.app_root, 'app/views')
  set :assets, AssetsEnvironment.get(settings.app_root,
                                     settings.production)

  Sprockets::Helpers.configure do |config|
    config.environment  = settings.assets
    config.prefix       = '/assets'
    config.digest       = true
    config.public_path  = settings.public_folder
  end
end

configure :development do
  Slim::Engine.set_options pretty: true, sort_attrs: false
end

require './app/helpers'
require './app/routes'
