# frozen_string_literal: true

require_relative 'config'
require 'pry'

module Msal
  # Create Authentication request for Azure Identity Service
  class Auth
    def initialize(authority_klass)
      @authority_klass = authority_klass
    end

    def authorize_uri
      CGI.escape("#{@authority_klass.url}/#{@authority_klass.tenant}/#{@authority_klass.path}?" \
                   "client_id=#{@authority_klass.client_id}"          \
                   "&response_type=#{@authority_klass.response_type}" \
                   "&redirect_uri=#{@authority_klass.redirect_uri}"   \
                   "&response_mode=#{@authority_klass.response_mode}" \
                   "&scope=#{@authority_klass.scope}&state=#{@authority_klass.state}")
    end
  end
end
