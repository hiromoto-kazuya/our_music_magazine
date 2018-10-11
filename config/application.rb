require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module OurMusicMagazine
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.encoding = "utf-8"
    
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
      g.test_framework false
    end
  end
end
