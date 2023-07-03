# frozen_string_literal: true

module Msal
  # Error Handling of Library
  class MsalError < StandardError
    def initialize(code, message = '')
      super(message)
      @code = code
      @message = message
    end

    def message
      formatted_error
    end

    def formatted_error
      %(#{code_format} #{@message})
    end

    def code_format
      @code.to_s.split('_').map(&:capitalize).join('')
    end
  end
end
