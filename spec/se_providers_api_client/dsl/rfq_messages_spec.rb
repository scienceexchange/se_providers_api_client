# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQMessages do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_rfq_messages") do
      collection = SeProvidersApiClient.client.get_rfq_messages
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/rfq_messages
  # Get rfq_messages. See https://demo.scienceexchange.com/api-docs/providers#/rfq_messages/getProvidersV1RFQMessages
  describe "#get_rfq_messages" do
    it "returns an array of rfq_messages" do
      VCR.use_cassette("get_rfq_messages") do
        rfq_messages = SeProvidersApiClient.client.get_rfq_messages
        expect(rfq_messages).to be_a(Array)
        expect(rfq_messages.first).to be_a(RFQMessage)
      end
    end
  end

  # GET /api/providers/v1/rfq_messages/{id}
  # Get a RFQ message. See https://demo.scienceexchange.com/api-docs/providers#/rfq_messages/getProvidersV1RFQMessagesId
  describe "#get_rfq_message" do
    it "returns a rfq message" do
      VCR.use_cassette("get_rfq_message") do
        expect(SeProvidersApiClient.client.get_rfq_message(id: id)).to be_a(RFQMessage)
      end
    end
  end
end
