# frozen_string_literal: true

# Classe criptografadora/descriptografadora de campos
# do ActiveRecord
class EncryptedField
  # Carrega um campo do ActiveRecord criptografado
  # e descriptografa para o valor para texto simples
  #
  # ## Parâmetros
  # - value: Valor a ser descriptografado
  #
  # ## Retorno
  # Valor em texto simples
  #
  # ## Exemplos
  #
  #   EncryptedField.new.load('HYZT8QonFPTLPAJhoF6ARA==\n')
  #   # => "Marcia Gentil"
  def load(value)
    return if invalid?(value)

    Crypto.decrypt(Base64.decode64(value))
  end

  # Salva um campo do ActiveRecord descriptografado
  # e criptografa-o com o módulo `Crypto` e codifica-o
  # em base 64 para salvar no banco de dados.
  #
  # ## Parâmetros
  # - value: Valor a ser criptografado
  #
  # ## Retorno
  # Valor codificado em base 64
  #
  # ## Exemplos
  #
  #   EncryptedField.new.dump('Márcia Gentil')
  #   # => "HYZT8QonFPTLPAJhoF6ARA==\n"
  def dump(value)
    return if invalid?(value)

    Base64.encode64(Crypto.encrypt(value))
  end

  private

  def invalid?(value)
    return true unless value
    return true if value == ''

    false
  end
end
