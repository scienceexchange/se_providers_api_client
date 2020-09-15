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

      # GET /api/providers/v1/currency_codes/{id}
      # Get an currency code. See https://demo.scienceexchange.com/api-docs/providers#/currency_codes/getProvidersV1CurrencyCodesId
      # @param [Hash] options The options to get a currency code with.
      # @option options [String, Fixnum] :id A currency code ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::CurrencyCode, nil].
      def get_currency_code(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::CurrencyCode.parse(request(:get, "currency_codes/#{id}"))
      end
    end
  end
end
