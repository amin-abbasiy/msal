# frozen_string_literal: true

module Msal
  # Parse Authorization response
  class Response
    def initialize(response)
      @response = response
    end

    def code
      raise ::Msal::AuthorizationError if @response[:error]

      @response[:code]
    end
  end
end
