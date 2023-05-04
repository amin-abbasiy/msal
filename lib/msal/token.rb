module Msal
  class Token
    def initialize(params)
      @client_id = params['client_id']
      @scope = params['scope']
      @code = params['code']
      @redirect_uri = params['redirect_uri']
      @grant_type = params['grant_type']
      @client_secret = params['client_secret']
    end

    def request
      response = Net::HTTP.post(url, params, headers = headers)
      return response if response.is_a?(Net::HTTPSuccess)

      raise ::Msal::AuthorizationError
    end

    def params
      {
        client_id: @client_id,
        scope: @scope,
        code: @code,
        redirect_uri: @redirect_uri,
        grant_type: @grant_type,
        client_secret: @client_secret
      }
    end

    def url
      URI("https://login.microsoftonline.com/#{tenant || 'common'}/oauth2/v2.0/token")
    end

    def tenant

    end

    def headers
      { 'Content-Type' => 'application/json' }
    end
  end
end