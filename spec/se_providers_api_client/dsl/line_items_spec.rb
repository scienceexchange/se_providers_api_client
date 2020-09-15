# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::LineItems do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_line_items") do
      collection = SeProvidersApiClient.client.get_line_items
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/line_items/{id}
  # Get a line item. See https://demo.scienceexchange.com/api-docs/providers#/line_items/getProvidersV1LineItemsId
  describe "#get_line_item", skip: "TODO" do
    it "returns a line_item" do
      VCR.use_cassette("get_line_item") do
        expect(SeProvidersApiClient.client.get_line_item(id: id)).to be_a(LineItem)
      end
    end
  end
end
