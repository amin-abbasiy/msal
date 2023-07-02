# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/msal/token'

RSpec.describe ::Msal::Token do
  context 'successful' do
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

    let(:sample_response) do
      {
        "token_type": 'Bearer',
        "scope": 'user.read mail.read',
        "expires_in": 3600,
        "access_token": 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik5HVEZ2ZEstZnl0aEV1Q',
        "refresh_token": 'AwABAAAAvPM1KaPlrEqdFSBzjqfTGAMxZGUTdM0t4B4'
      }
    end
    it 'Return Access Token' do
      stub_request(:post, 'https://login.microsoftonline.com/common/oauth2/v2.0/token')
        .with({
                body: payload
              })
        .to_return({
                     status: 200,
                     body: sample_response.to_json
                   })

      response = ::Msal::Token.new(payload, 'common').request

      expect(response.body).to eq(sample_response.to_json)
    end
  end
  context 'Error' do
    let(:error_response) do
      {
        "error": 'Error'
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
    it 'Request Error' do
      stub_request(:post, 'https://login.microsoftonline.com/common/oauth2/v2.0/token')
        .with(
          body: invalid_payload
        ).to_return(
          status: 403,
          body: error_response.to_json
        )

      expect { ::Msal::Token.new(invalid_payload, 'common').request }.to raise_error(Msal::AuthorizationError)
    end
  end
end
