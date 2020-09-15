# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQs do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_rfqs") do
      collection = SeProvidersApiClient.client.get_rfqs
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/rfqs/{id}
  # Get a RFQ. See https://demo.scienceexchange.com/api-docs/providers#/rfqs/getProvidersV1RFQsId
  describe "#get_rfq" do
    it "returns a rfq" do
      VCR.use_cassette("get_rfq") do
        expect(SeProvidersApiClient.client.get_rfq(id: id)).to be_a(RFQ)
      end
    end
  end
end
