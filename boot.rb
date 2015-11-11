require 'yaml'
require 'json'

require 'bundler'
Bundler.require(:default, :app, ENV['RACK_ENV'].to_sym)
require './config/sprockets'

require './app/helpers'
helpers Helpers

def self.load_data(type)
  path = File.expand_path("../data/#{type}.yml", __FILE__)
  YAML.load(open(path).read) if File.exist?(path)
end

configure do
  set :production, ENV['RACK_ENV'].eql?('production')
  set :app_root, File.expand_path('..', __FILE__)
  set :views, File.join(settings.app_root, 'app/views')
  set :assets, AssetsEnvironment.get(settings.app_root,
                                     settings.production)

  # load static data
  set :termine, load_data(:termine) || []
  set :mitglieder, load_data(:mitglieder).sort_by { |m| m['id'] }

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

require './app/routes'

not_found do
  slim :'404'
end
