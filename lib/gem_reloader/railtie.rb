class GemReloaderRailtie < Rails::Railtie
  initializer 'gem_reloader.autoload', :before => :set_autoload_paths do |app|
    app.config.autoload_paths += Dir["#{app.config.root}/vendor/gems/"]
  end
end