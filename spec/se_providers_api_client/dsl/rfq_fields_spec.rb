# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQFields do
  # GET /api/providers/v1/rfq_fields
  # Get rfq_fields. See https://demo.scienceexchange.com/api-docs/providers#/rfq_fields/getProvidersV1RFQFields
  describe "#get_rfq_fields" do
    it "returns an array of rfq_fields" do
      VCR.use_cassette("get_rfq_fields") do
        rfq_fields = SeProvidersApiClient.client.get_rfq_fields
        expect(rfq_fields).to be_a(Array)
        expect(rfq_fields.first).to be_a(RFQField)
      end
    end
  end
end
