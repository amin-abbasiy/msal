require_relative '../spec_helper'
require_relative '../../lib/msal/token'

RSpec.describe ::Msal::Token do
  let(:payload) do
    {
      client_id: '11111111-1111-1111-1111-111111111111',
      scope: 'user.read mail.read',
      code: '9a7daa06-9ac9-45ef-bd99-471392fb37a3',
      redirect_uri: 'http://localhost/app',
      grant_type: 'authorization_code',
      client_secret: '9a7daa06-9ac9-45ef-bd99-471392fb37a3'
    }
  end

  let(:invalid_payload) do
    {
      client_id: '11111111-1111-1111-1111-111111111111',
      scope: 'user.read mail.read',
      code: '9a7daa06-9ac9',
      redirect_uri: 'http://localhost/app',
      grant_type: 'authorization_code',
      client_secret: '9a7daa06-9ac9-45ef-bd99-471392fb37a3'
    }
  end

  let(:headers) do
    { 'Content-Type' => 'application/json' }
  end

  let(:sample_response) {
    {
      "token_type": "Bearer",
      "scope": "user.read mail.read",
      "expires_in": 3600,
      "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik5HVEZ2ZEstZnl0aEV1Q",
      "refresh_token": "AwABAAAAvPM1KaPlrEqdFSBzjqfTGAMxZGUTdM0t4B4"
    }
  }
  before do
    stub_request(:post, 'https://login.microsoftonline.com/common/oauth2/v2.0/token')
      .with(body: invalid_payload, headers: headers)
      .to_return(status: 403, body: "")
  end

  it "RequestError for token failed attempt" do
    expect { ::Msal::Token.new(invalid_payload).request }.to raise_error(::Msal::AuthorizationError)
  end


  xit 'return access code from request' do
    stub_request(:post, 'https://login.microsoftonline.com/common/oauth2/v2.0/token')
      .with(body: payload)
      .to_return(status: 200, body: 'codecode')

    auth = ::Msal::Auth.new(payload)
    expect(auth.request).to eq('codecode')
  end
end