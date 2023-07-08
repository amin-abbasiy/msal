# frozen_literal_string= true

require_relative 'config'
require 'pry'

module Msal
  # Used for shape parameters
  class Authority
    def initialize(type, parameters)
      @type = type
      @parameters = parameters
    end

    def shape_payload
      case @type
      when 'authorize'
        authorize_payload
      else
        return 'Undefined Request Type'
      end

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
        url: @parameters[:url]
      }
    end
  end
end