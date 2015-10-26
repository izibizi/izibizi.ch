require 'bundler'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, :assets, ENV['RACK_ENV'].to_sym)

# Increase Sass number precision if below 8
::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

class AssetsEnvironment
  def self.get(root_path, preprocess = false)
    assets = Sprockets::Environment.new root_path

    assets.context_class.class_eval do
      def asset_path(path, options = {})
        "app/assets/#{path}"
      end
    end

    assets.append_path('app/assets/css')
    assets.append_path('app/assets/js')
    assets.append_path('app/assets/img')
    assets.append_path('vendor/assets')

    assets.cache = Sprockets::Cache::FileStore.new("#{root_path}/tmp")

    if preprocess
      assets.js_compressor = :uglify
      assets.css_compressor = :scss
    end

    return assets
  end
end
