# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::CurrencyCodes do
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
end
