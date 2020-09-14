# frozen_string_literal: true

require "spec_helper"

shared_examples "se_providers_api_client/errors/client_error" do
  subject(:client_error) do
    described_class.new(
      method: method,
      url: url,
      headers: headers,
      response: response
    )
  end

  let(:method) { "POST" }
  let(:url) { "http://www.example.com" }
  let(:headers) { "request headers here" }
  let(:response) { double("Response", headers: "response headers", body: "response body") }

  it "prints out a helpful error message" do
    expected_error_message = <<-ERROR.gsub(/^\s*/, "")
       HTTP POST http://www.example.com
       Request Headers: request headers here
       Response Headers: response headers
       Response Body:
       response body
    ERROR

    expect do
      raise client_error
    end.to raise_error(SeProvidersApiClient::Errors::ClientError, expected_error_message)
  end
end

describe SeProvidersApiClient::Errors::ClientError do
  include_examples "se_providers_api_client/errors/client_error"
end

describe SeProvidersApiClient::Errors::ResourceNotFoundError do
  include_examples "se_providers_api_client/errors/client_error"
end
