require 'yaml'
require 'json'

require 'bundler'
Bundler.require(:default, :app, ENV['RACK_ENV'].to_sym)
require './config/sprockets'

require './app/helpers'
helpers Helpers

module DataLoaders
  def self.load_data(type)
    path = File.expand_path("../data/#{type}.yml", __FILE__)
    YAML.load(open(path).read) if File.exist?(path)
  end

  def self.load_schnitzelbank_data
    files = File.expand_path('../data/schnitzelbank/*.md', __FILE__)
    Dir.glob(files).map do |file|
      name = File.basename(file, '.md')
      text = open(file).read
      [name, convert(text)]
    end.to_h
  end

  private

  def self.convert(markdown)
    Kramdown::Document.new(markdown, auto_ids: false).to_html
  end
end

configure do
  set :app_root, File.expand_path('..', __FILE__)
  set :views, File.join(settings.app_root, 'app/views')
  set :assets, AssetsEnvironment.get(settings.app_root,
                                     production?)

  # load static data
  set :termine, DataLoaders.load_data(:termine) || []
  set :mitglieder, DataLoaders.load_data(:mitglieder).sort_by { |m| m['id'] }
  set :schnitzelbank, DataLoaders.load_schnitzelbank_data

  Sprockets::Helpers.configure do |config|
    config.environment  = settings.assets
    config.prefix       = '/assets'
    config.digest       = true
    config.public_path  = settings.public_folder
    config.asset_host   = ENV['ASSET_HOST'] if ENV['ASSET_HOST']
  end
end

configure :development do
  Slim::Engine.set_options pretty: true, sort_attrs: false
end

configure :production do
  set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 30]
end

before do
  # Default values
  @title = nil
  @description = 'Die Guggenmusig Izi bizi tini wini macht seit 1986 die Fasnacht in Herisau und Umgebung unsicher. Die Freude an der Musik und der Gemeinschaftsgedanke stehen dabei im Vordergrund.'
end
require './app/routes'

not_found do
  slim :'404'
end
