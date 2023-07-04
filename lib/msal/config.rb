module Msal
  class Config
    TENANT = 'common'.freeze
    BASE_URL = 'https://login.microsoftonline.com'.freeze
    AUTHORIZATION_PATH = 'oauth2/v2.0/authorize'.freeze
    TOKEN_PATH = 'oauth2/v2.0/token'.freeze
    HTTP_HEADERS = { 'Content-Type' => 'application/json' }
    AUTH_RESPONSE_MODE = 'query'
    AUTH_RESPONSE_TYPE = 'code'
  end
end