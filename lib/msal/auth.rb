# frozen_string_literal: true

module Msal
    class Auth
        MANDATORY_PARAMS = [:client_id, :scope]

        def initialize(payload = {})
            @client_id = payload[:client_id]
            @tenant = payload[:tenant] || 'common'
            @response_type = payload[:response_type] || 'code'
            @response_mode = payload[:response_mode] || 'query'
            @scope = payload[:scope]
            @redirect_uri = payload[:redirect_uri]
            @state = payload[:state]
            @url = "https://login.microsoftonline.com/#{@tenant}/oauth2/v2.0/authorize"

            # raise ::ArgumentError => e if validate_params(payload)
        end

        def authorize_uri
            CGI.escape("#{@url}?"                           +
                         "client_id=#{@client_id}"          +
                         "&response_type=#{@response_type}" +
                         "&redirect_uri=#{@redirect_uri}"   +
                         "&response_mode=#{@response_mode}" +
                         "&scope=#{@scope}&state=#{@state}")
        end


        private
        def validate_params(payload)
            payload.each {|k, v| MANDATORY_PARAMS.include?(k) && k[v].nil? }
        end
    end
end
