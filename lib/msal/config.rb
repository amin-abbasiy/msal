# frozen_string_literal: true

module Msal
  # User for common configuration
  class Config
    TENANT = 'common'
    BASE_URL = 'https://login.microsoftonline.com'
    AUTHORIZATION_PATH = 'oauth2/v2.0/authorize'
    TOKEN_PATH = 'oauth2/v2.0/token'
    HTTP_HEADERS = { 'Content-Type' => 'application/json' }.freeze
    AUTH_RESPONSE_MODE = 'query'
    AUTH_RESPONSE_TYPE = 'code'
    AUTHORIZE_MANDATORY_PARAMS = %i[client_id scope].freeze
  end
end
