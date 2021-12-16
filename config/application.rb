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
    # Inicializa o Rails com configuração padrão da versão 6.1
    config.load_defaults 6.1

    # Configuração de fuso-horário
    config.time_zone = 'America/Sao_Paulo'

    # Carrega as traduções de erros e mensagens, com valor padrão
    # para o pt-BR (Português Brasil)
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Carrega diretórios customizados com classes e módulos
    config.autoload_paths << Rails.root.join('app/repositories')
    config.eager_load_paths << Rails.root.join('lib')
  end
end
