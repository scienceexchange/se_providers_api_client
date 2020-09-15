# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module QuoteVersions
      # GET /api/providers/v1/quote_versions
      # Get quote_versions. See https://demo.scienceexchange.com/api-docs/providers#/quote_versions/getProvidersV1QuoteVersions
      # @return [Array].
      def get_quote_versions
        Resources::QuoteVersion.parse(request(:get, "quote_versions/", nil, nil))
      end
    end
  end
end
