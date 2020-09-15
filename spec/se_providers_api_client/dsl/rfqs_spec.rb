# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQs do
  # GET /api/providers/v1/rfqs
  # Get rfqs. See https://demo.scienceexchange.com/api-docs/providers#/rfqs/getProvidersV1RFQs
  describe "#get_rfqs" do
    it "returns an array of rfqs" do
      VCR.use_cassette("get_rfqs") do
        rfqs = SeProvidersApiClient.client.get_rfqs
        expect(rfqs).to be_a(Array)
        expect(rfqs.first).to be_a(RFQ)
      end
    end
  end
end
