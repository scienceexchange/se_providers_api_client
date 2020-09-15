# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Facilities do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_facilities") do
      collection = SeProvidersApiClient.client.get_facilities
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/facilities
  # Get facilities. See https://demo.scienceexchange.com/api-docs/providers#/facilities/getProvidersV1Facilities
  describe "#get_facilities" do
    it "returns an array of facilities" do
      VCR.use_cassette("get_facilities") do
        facilities = SeProvidersApiClient.client.get_facilities
        expect(facilities).to be_a(Array)
        expect(facilities.first).to be_a(Facility)
      end
    end
  end

  # GET /api/providers/v1/facilities/{id}
  # Get a facility. See https://demo.scienceexchange.com/api-docs/providers#/facilities/getProvidersV1FacilitiesId
  describe "#get_facility" do
    it "returns a facility" do
      VCR.use_cassette("get_facility") do
        expect(SeProvidersApiClient.client.get_facility(id: id)).to be_a(Facility)
      end
    end
  end
end
