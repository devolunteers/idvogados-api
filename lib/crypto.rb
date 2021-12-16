# frozen_string_literal: true

# Módulo centralizador dos métodos
# para realizar ações de criptografia
# e descriptografia
module Crypto
  class << self
    ALGO = 'aes-256-cbc'

    # Criptografa o dado passado no método
    #
    # ## Parâmetros
    # - value: Valor descriptografado a ser criptografado
    #
    # ## Retorno
    # Valor criptografado
    #
    # ## Exemplos
    #
    #   Crypto.encrypt('test')
    #   # => "\xFC\x01R\xBC\x96m|\x8C\xC1\xDC;\xAA\xEF\xEC\x03}"
    def encrypt(value)
      crypt(:encrypt, value)
    end

    # Descriptografa o dado passado no método
    #
    # ## Parâmetros
    # - value: Valor criptografado a ser descriptografado
    #
    # ## Retorno
    # Valor descriptografado
    #
    # ## Exemplos
    #
    #   Crypto.decrypt("\xFC\x01R\xBC\x96m|\x8C\xC1\xDC;\xAA\xEF\xEC\x03}")
    #   # => "test"
    def decrypt(value)
      crypt(:decrypt, value)
    end

    # Realiza operação de criptografia/descriptografia de um dado
    #
    # ## Parâmetros
    # - cipher_method: Método de criptografia
    #   - `:encrypt` => Criptografar
    #   - `:decrypt` => Descriptografar
    # - value: Valor a ser criptografado/descriptografado
    #
    # ## Retorno
    # Valor criptografado/descriptografado
    #
    # ## Exemplos
    #
    #   Crypto.crypt(:encrypt, 'test')
    #   # => "\xFC\x01R\xBC\x96m|\x8C\xC1\xDC;\xAA\xEF\xEC\x03}"
    #
    #   Crypto.crypt(:decrypt, "\xFC\x01R\xBC\x96m|\x8C\xC1\xDC;\xAA\xEF\xEC\x03}")
    #   # => "test"
    def crypt(cipher_method, value)
      cipher = OpenSSL::Cipher::Cipher.new(ALGO)

      cipher.send(cipher_method)
      cipher.pkcs5_keyivgen(encryption_key)

      result = cipher.update(value)
      result << cipher.final
    end

    private

    def encryption_key
      IdvogadosApi.encryption_key
    end
  end
end
