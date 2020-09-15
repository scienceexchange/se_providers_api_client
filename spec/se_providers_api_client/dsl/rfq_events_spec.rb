# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQEvents do
  # GET /api/providers/v1/rfq_events
  # Get rfq_events. See https://demo.scienceexchange.com/api-docs/providers#/rfq_events/getProvidersV1RFQEvents
  describe "#get_rfq_events", skip: 'TODO' do
    it "returns an array of rfq_events" do
      VCR.use_cassette("get_rfq_events") do
        rfq_events = SeProvidersApiClient.client.get_rfq_events
        expect(rfq_events).to be_a(Array)
        expect(rfq_events.first).to be_a(RFQEvent)
      end
    end
  end

  describe "#get_rfq_event" do
    it "raises a not implemented error" do
    end
  end
end
