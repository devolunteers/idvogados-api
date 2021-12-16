# frozen_string_literal: true

# Public: Classe base da camada de acesso ao banco de dados
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
