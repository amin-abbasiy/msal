# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/msal/http'
require 'net/http'

RSpec.describe Msal::HTTP do
  context '#GET' do
    let(:http) { Msal::HTTP.new(hostname: 'example.com') }

    it 'returns a response' do
      VCR.use_cassette('msal_get_success') do
        response = http.get('/')

        expect(response.code.to_i).to eq(200)
      end
    end
  end

  context '#POST' do
    let(:http) { Msal::HTTP.new(hostname: 'example.com', params: { name: 'amin' }) }

    it 'returns a response' do
      VCR.use_cassette('msal_post_success') do
        response = http.post('/')

        expect(response.code.to_i).to eq(200)
      end
    end
  end
end
