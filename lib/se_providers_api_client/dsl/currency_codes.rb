# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module CurrencyCodes
      # GET /api/providers/v1/currency_codes
      # Get currency_codes. See https://demo.scienceexchange.com/api-docs/providers#/currency_codes/getProvidersV1CurrencyCodes
      # @return [Array].
      def get_currency_codes
        Resources::CurrencyCode.parse(request(:get, "currency_codes/", nil, nil))
      end
    end
  end
end
