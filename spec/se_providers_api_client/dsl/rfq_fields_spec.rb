# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQFields do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_rfq_fields") do
      collection = SeProvidersApiClient.client.get_rfq_fields
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/rfq_fields/{id}
  # Get a RFQ field. See https://demo.scienceexchange.com/api-docs/providers#/rfq_fields/getProvidersV1RFQFieldsId
  describe "#get_rfq_field" do
    it "returns a rfq_field" do
      VCR.use_cassette("get_rfq_field") do
        expect(SeProvidersApiClient.client.get_rfq_field(id: id)).to be_a(RFQField)
      end
    end
  end
end
