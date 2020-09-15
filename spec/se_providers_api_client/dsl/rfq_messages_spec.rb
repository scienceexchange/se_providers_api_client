# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQMessages do
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
end
