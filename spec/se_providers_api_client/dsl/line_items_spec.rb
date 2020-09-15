# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::LineItems do
  # GET /api/providers/v1/line_items
  # Get line_items. See https://demo.scienceexchange.com/api-docs/providers#/line_items/getProvidersV1LineItems
  describe "#get_line_items", skip: 'TODO' do
    it "returns an array of line_items" do
      VCR.use_cassette("get_line_items") do
        line_items = SeProvidersApiClient.client.get_line_items
        expect(line_items).to be_a(Array)
        expect(line_items.first).to be_a(LineItem)
      end
    end
  end
end
