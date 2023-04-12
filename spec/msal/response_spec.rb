# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/msal/response'
require 'pry'

RSpec.describe Msal::Response do
  let(:correct_response) {
    {
      code: '9a7daa06-9ac9-45ef-bd99-471392fb37a3',
      state: '11111'
    }
  }

  let(:error_in_response) {
    {
      error: { code: "Forbidden" }
    }
  }

  it "return AuthorizationError if user did not grant permission" do
    response = ::Msal::Response.new(error_in_response)

    expect { response.code }.to raise_error(::Msal::AuthorizationError)
  end

  it "token request response" do
    response = ::Msal::Response.new(correct_response)

    expect(response.code).to eq('9a7daa06-9ac9-45ef-bd99-471392fb37a3')
  end
end