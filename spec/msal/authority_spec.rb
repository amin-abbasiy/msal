require_relative '../../lib/msal/authority'

RSpec.describe ::Msal::Authority do
  subject { described_class.new(type, parameters) }

  context 'Auth class' do
    let(:parameters) do
      {
        client_id: '1111',
        tenant: 'common',
        response_type: 'code',
        response_mode: 'query',
        scope: 'openid',
        redirect_uri: 'http://localhost:3000',
        state: 'state',
        url: 'https://example.com'
      }
    end

    let(:type) { 'authorize' }

    it 'Auth class params' do
      expect(subject.shape_payload).to eq(parameters)
    end

    it 'method call validity' do
      expect(subject.client_id).to eq('1111')
    end
  end
end