# frozen_string_literal: true

require_relative 'msal_error'
require_relative 'config'

module Msal
  # Used for request and Acquire tokens from Ms Graph
  class Token
    def initialize(params,
                   tenant = Msal::Config::TENANT,
                   base_url = ::Msal::Config::BASE_URL,
                   path = ::Msal::Config::TOKEN_PATH)
      @tenant = tenant
      @base_url = base_url
      @path = path
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
      URI("#{@base_url}/#{@tenant}/#{@path}")
    end

    def headers
      ::Msal::Config::HTTP_HEADERS
    end
  end
end
