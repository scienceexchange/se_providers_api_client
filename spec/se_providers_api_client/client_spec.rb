# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::Client do
  subject(:client) { SeProvidersApiClient::Client.new }

  it "makes request to scienceexchange.com/api/providers/v1" do
    VCR.use_cassette("z_se_providers_api_client_status_check") do
      # response = client.request(:get, 'Users')
      # expect(response.status).to eq(200)
    end
  end
end
