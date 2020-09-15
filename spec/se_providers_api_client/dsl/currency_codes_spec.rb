# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::CurrencyCodes do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_currency_codes") do
      collection = SeProvidersApiClient.client.get_currency_codes
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/currency_codes
  # Get currency_codes. See https://demo.scienceexchange.com/api-docs/providers#/currency_codes/getProvidersV1CurrencyCodes
  describe "#get_currency_codes" do
    it "returns an array of currency_codes" do
      VCR.use_cassette("get_currency_codes") do
        currency_codes = SeProvidersApiClient.client.get_currency_codes
        expect(currency_codes).to be_a(Array)
        expect(currency_codes.first).to be_a(CurrencyCode)
      end
    end
  end

  # GET /api/providers/v1/currency_codes/{id}
  # Get a currency code. See https://demo.scienceexchange.com/api-docs/providers#/currency_codes/getProvidersV1CurrencyCodesId
  describe "#get_currency_code" do
    it "returns a currency_code" do
      VCR.use_cassette("get_currency_code") do
        expect(SeProvidersApiClient.client.get_currency_code(id: id)).to be_a(CurrencyCode)
      end
    end
  end
end
