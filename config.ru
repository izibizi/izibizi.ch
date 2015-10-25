require 'bundler'
Bundler.require(:default, :rackup, ENV['RACK_ENV'].to_sym)

if ENV['RACK_ENV'].eql?('development')
  require './config/sprockets'
  assets = Izibizi::AssetsEnvironment.get(File.expand_path('..', __FILE__))
  map('/assets') { run assets }
end

require './boot'
map('/') { run Sinatra::Application }
