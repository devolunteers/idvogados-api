# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Public: Classe de configuração da aplicação
module IdvogadosApi
  class << self
    attr_accessor :encryption_key

    def config
      yield self
    end
  end

  # Public: Classe inicializadora da aplicação
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths << config.root.join('lib')
    # Carrega diretórios customizados com classes e módulos
    config.eager_load_paths << Rails.root.join('lib')
  end
end
