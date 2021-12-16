# frozen_string_literal: true

IdvogadosApi.config do |c|
  c.encryption_key = ENV['ENCRYPTION_KEY'] if Rails.env.production?
  c.encryption_key = 'ENCRYPTION_KEY' unless Rails.env.production?
end
