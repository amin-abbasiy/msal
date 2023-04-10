module Msal
  class Response
    def initialize(response)
      @response = response
    end

    def code
      begin
        @response.code
      rescue ::Msal::AuthorizationError => e
        puts e
      end
    end
  end
end