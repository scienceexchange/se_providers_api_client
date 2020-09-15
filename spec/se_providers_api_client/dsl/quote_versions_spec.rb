# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::QuoteVersions do
  # GET /api/providers/v1/quote_versions
  # Get quote_versions. See https://demo.scienceexchange.com/api-docs/providers#/quote_versions/getProvidersV1QuoteVersions
  describe "#get_quote_versions" do
    it "returns an array of quote_versions" do
      VCR.use_cassette("get_quote_versions") do
        quote_versions = SeProvidersApiClient.client.get_quote_versions
        expect(quote_versions).to be_a(Array)
        expect(quote_versions.first).to be_a(QuoteVersion)
      end
    end
  end
end
