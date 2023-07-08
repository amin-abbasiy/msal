# frozen_string_literal: true

require_relative 'config'

module Msal
  # Used for shape parameters
  class Authority
    def initialize(type, parameters)
      @type = type
      @parameters = parameters

      shape_payload
    end

    def shape_payload
      send("#{@type}_payload").each_pair do |key, value|
        ::Msal::Authority.define_method(key.to_sym) { value }
      end
    end

    private

    def authorize_payload
      {
        client_id: @parameters[:client_id],
        tenant: @parameters[:tenant] || ::Msal::Config::TENANT,
        response_type: @parameters[:response_type] || ::Msal::Config::AUTH_RESPONSE_TYPE,
        response_mode: @parameters[:response_mode] || ::Msal::Config::AUTH_RESPONSE_MODE,
        scope: @parameters[:scope],
        redirect_uri: @parameters[:redirect_uri],
        state: @parameters[:state],
        url: @parameters[:url] || ::Msal::Config::BASE_URL,
        path: @parameters[:path] || ::Msal::Config::AUTHORIZATION_PATH
      }
    end
  end
end
