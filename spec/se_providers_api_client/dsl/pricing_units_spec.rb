# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::PricingUnits do
  # GET /api/providers/v1/pricing_units
  # Get pricing_units. See https://demo.scienceexchange.com/api-docs/providers#/pricing_units/getProvidersV1PricingUnits
  describe "#get_pricing_units" do
    it "returns an array of pricing_units" do
      VCR.use_cassette("get_pricing_units") do
        pricing_units = SeProvidersApiClient.client.get_pricing_units
        expect(pricing_units).to be_a(Array)
        expect(pricing_units.first).to be_a(PricingUnit)
      end
    end
  end
end
