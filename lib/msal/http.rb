# frozen_string_literal: true

require_relative 'config'
require 'net/http'

module Msal
  # @param hostname [String] hostname of the request
  # @param params [Hash] parameters of the request
  # @return [Net::HTTPResponse] response of the request
  # @example
  #  http = Msal::HTTP.new(hostname: 'example.com', params: { name: 'amin' })
  #  response = http.post('/')
  #  response.code.to_i # => 200
  class HTTP
    def initialize(hostname:, params: {})
      @params = params
      @hostname = hostname || Msal::Config::BASE_URL
      @http = Net::HTTP.new(@hostname)
    end

    def get(path)
      request = Net::HTTP::Get.new(path)
      @http.request(request)
    end

    def post(path)
      request = Net::HTTP::Post.new(path)
      request.set_form_data(@params)
      @http.request(request)
    end
  end
end
