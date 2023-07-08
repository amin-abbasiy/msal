# frozen_string_literal: true

require 'pry'

require_relative '../spec_helper'
require_relative '../../lib/msal/auth'
require_relative '../../lib/msal/authority'

RSpec.describe Msal::Auth do
  let(:payload) do
    {
      client_id: '11111111-1111-1111-1111-111111111111',
      tenant: 'common',
      response_type: 'code',
      response_mode: 'query',
      scope: 'offline_access openid profile',
      redirect_uri: 'http://localhost/myapp',
      state: '11111'
    }
  end

  let(:authorization_uri) do
    CGI.escape('https://login.microsoftonline.com/common/oauth2/v2.0/authorize?' \
                                         'client_id=11111111-1111-1111-1111-111111111111' \
                                         '&response_type=code' \
                                         '&redirect_uri=http://localhost/myapp&response_mode=query' \
                                         '&scope=offline_access openid profile' \
                                         '&state=11111')
  end
  context 'url creation' do
    let(:authority_klass) do
      ::Msal::Authority.new('authorize', payload)
    end

    it 'authorization uri' do
      auth = ::Msal::Auth.new(authority_klass)
      expect(auth.authorize_uri).to eq(authorization_uri)
    end
  end
end
