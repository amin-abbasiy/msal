# frozen_string_literal: true

require_relative 'msal_error'

module Msal
  # Used for request and Acquire tokens from Ms Graph
  class Token
    def initialize(params, tenant)
      @tenant = tenant
      params.keys.map do |key|
        instance_variable_set("@#{key}", params[key])
      end
    end

    def request
      response = Net::HTTP.post(url, params.to_json, headers)
      return response if response.is_a?(Net::HTTPSuccess)

      raise ::Msal::MsalError.new(:authorization_error, 'Authorization failed!')
    end

    def params
      {
        'client_id' => @client_id,
        'scope' => @scope,
        'code' => @code,
        'redirect_uri' => @redirect_uri,
        'grant_type' => @grant_type,
        'client_secret' => @client_secret
      }
    end

    def url
      URI("https://login.microsoftonline.com/#{@tenant || 'common'}/oauth2/v2.0/token")
    end

    def headers
      { 'Content-Type' => 'application/json' }
    end
  end
end
