# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::QuoteVersions do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_quote_versions") do
      collection = SeProvidersApiClient.client.get_quote_versions
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/quote_versions/{id}
  # Get a quote version. See https://demo.scienceexchange.com/api-docs/providers#/quote_versions/getProvidersV1QuoteVersionsId
  describe "#get_quote_version" do
    it "returns a quote_version" do
      VCR.use_cassette("get_quote_version") do
        expect(SeProvidersApiClient.client.get_quote_version(id: id)).to be_a(QuoteVersion)
      end
    end
  end
end
