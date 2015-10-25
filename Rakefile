require 'rake/sprocketstask'
require './config/sprockets'

root = File.expand_path('..', __FILE__)
Rake::SprocketsTask.new do |t|
  t.environment = Izibizi::AssetsEnvironment.get(root, true)
  t.output      = File.expand_path('../public/assets', __FILE__)
  t.assets      = %w{application.js application.css}
end

task 'assets:precompile' => ['clobber_assets', 'assets']
