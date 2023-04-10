# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/msal/response'

RSpec.describe Msal::Response do
  let(:response) {

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

  it "token request response"
end