# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::PricingUnits do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_pricing_units") do
      collection = SeProvidersApiClient.client.get_pricing_units
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/pricing_units/{id}
  # Get a pricing unit. See https://demo.scienceexchange.com/api-docs/providers#/pricing_units/getProvidersV1PricingUnitsId
  describe "#get_pricing_unit" do
    it "returns a pricing_unit" do
      VCR.use_cassette("get_pricing_unit") do
        expect(SeProvidersApiClient.client.get_pricing_unit(id: id)).to be_a(PricingUnit)
      end
    end
  end
end
