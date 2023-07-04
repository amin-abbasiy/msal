# frozen_string_literal: true

require_relative 'config'

module Msal
  # Create Authentication request for Azure Identity Service
  class Auth
    MANDATORY_PARAMS = %i[client_id scope].freeze

    def initialize(payload = {}, base_url = ::Msal::Config::BASE_URL,
                   auth_path = ::Msal::Config::AUTHORIZATION_PATH)
      @client_id = payload[:client_id]
      @tenant = payload[:tenant] || ::Msal::Config::TENANT
      @response_type = payload[:response_type] || ::Msal::Config::RESPONSE_TYPE
      @response_mode = payload[:response_mode] || ::Msal::Config::RESPONSE_MODE
      @scope = payload[:scope]
      @redirect_uri = payload[:redirect_uri]
      @state = payload[:state]
      @url = "#{base_url}/#{@tenant}/#{auth_path}"

      # raise ::ArgumentError => e if validate_params(payload)
    end

    def authorize_uri
      CGI.escape("#{@url}?"                           \
                   "client_id=#{@client_id}"          \
                   "&response_type=#{@response_type}" \
                   "&redirect_uri=#{@redirect_uri}"   \
                   "&response_mode=#{@response_mode}" \
                   "&scope=#{@scope}&state=#{@state}")
    end

    private

    def validate_params(payload)
      payload.each { |k, v| MANDATORY_PARAMS.include?(k) && k[v].nil? }
    end
  end
end
