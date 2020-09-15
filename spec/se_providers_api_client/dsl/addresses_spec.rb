# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Addresses do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_addresses") do
      collection = SeProvidersApiClient.client.get_addresses
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/addresses/{id}
  # Get an address. See https://demo.scienceexchange.com/api-docs/providers#/addresses/getProvidersV1AddressesId
  describe "#get_address" do
    it "returns an address" do
      VCR.use_cassette("get_address") do
        expect(SeProvidersApiClient.client.get_address(id: id)).to be_a(Address)
      end
    end
  end
end
