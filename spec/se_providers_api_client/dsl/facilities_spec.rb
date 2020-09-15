# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Facilities do
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
end
