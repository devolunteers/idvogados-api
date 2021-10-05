# frozen_string_literal: true

# Public: Modelagem de um Usuário no Sistema
class User < ApplicationRecord
  # Campos criptografados
  serialize :name, EncryptedField.new
  serialize :email, EncryptedField.new

  # Validações
  validates :email, :name, :password, presence: true

  validates :password,
            length: {
              within: 8..128,
              if: :should_validate_and_update_password?
            }

  # Callbacks
  before_save :encrypt_password, if: :should_validate_and_update_password?

  # Métodos privados
  private

  def should_validate_and_update_password?
    new_record? || password_changed?
  end

  def encrypt_password
    self.password = EncryptedField.new.dump(password)
  end
end
