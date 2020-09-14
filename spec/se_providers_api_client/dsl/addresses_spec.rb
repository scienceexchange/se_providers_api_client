# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Addresses do
  # GET /api/providers/v1/addresses
  # Get addresses. See https://demo.scienceexchange.com/api-docs/providers#/addresses/getProvidersV1Addresses
  describe "#get_addresses" do
    it "returns an array of addresses" do
      VCR.use_cassette("get_addresses") do
        addresses = SeProvidersApiClient.client.get_addresses
        expect(addresses).to be_a(Array)
        expect(addresses.first).to be_a(Address)
      end
    end
  end
end
