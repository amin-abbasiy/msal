# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/msal/auth'

RSpec.describe Msal::Auth do
  let(:payload) {
    {
      client_id: '11111111-1111-1111-1111-111111111111',
      tenant: 'common',
      response_type: 'code',
      response_mode: 'query',
      scope: 'offline_access openid profile',
      redirect_uri: 'http://localhost/myapp',
      state: '11111'
    }
  }

  let(:authorization_uri) { CGI.escape("https://login.microsoftonline.com/common/oauth2/v2.0/authorize?" +
                                         "client_id=11111111-1111-1111-1111-111111111111" +
                                         "&response_type=code" +
                                         "&redirect_uri=http://localhost/myapp&response_mode=query" +
                                         "&scope=offline_access openid profile" +
                                         "&state=11111") }

  it "authorization uri" do
    auth = ::Msal::Auth.new(payload)
    expect(auth.authorize_uri).to eq(authorization_uri)
  end

  xit "RequestError for token failed attempt"


  xit 'return access code from request' do
    stub_request(:post, 'https://login.microsoftonline.com/common/oauth2/v2.0/token')
      .with(body: payload)
      .to_return(status: 200, body: 'codecode')

    auth = ::Msal::Auth.new(payload)
    data = auth.code

    expect(data).to eq('codecode')
  end
end
