# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Quotes do
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
end
