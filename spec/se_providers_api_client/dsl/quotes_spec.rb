# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Quotes do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_quotes") do
      collection = SeProvidersApiClient.client.get_quotes
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/quotes
  # Get quotes. See https://demo.scienceexchange.com/api-docs/providers#/quotes/getProvidersV1Quotes
  describe "#get_quotes" do
    it "returns an array of quotes" do
      VCR.use_cassette("get_quotes") do
        quotes = SeProvidersApiClient.client.get_quotes
        expect(quotes).to be_a(Array)
        expect(quotes.first).to be_a(Quote)
      end
    end
  end

  # GET /api/providers/v1/quotes/{id}
  # Get a quote. See https://demo.scienceexchange.com/api-docs/providers#/quotes/getProvidersV1QuotesId
  describe "#get_quote" do
    it "returns a quote" do
      VCR.use_cassette("get_quote") do
        expect(SeProvidersApiClient.client.get_quote(id: id)).to be_a(Quote)
      end
    end
  end
end
