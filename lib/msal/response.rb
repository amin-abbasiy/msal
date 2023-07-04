# frozen_string_literal: true

module Msal
  # Parse Authorization response
  class Response
    def initialize(response)
      @response = response
    end

    def code
      raise ::Msal::MsalError.new(:authorization_error, 'Authentication failed!') if @response[:error]

      @response[:code]
    end
  end
end
