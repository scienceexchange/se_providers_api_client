# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Quotes
      # GET /api/providers/v1/quotes
      # Get quotes. See https://demo.scienceexchange.com/api-docs/providers#/quotes/getProvidersV1Quotes
      # @return [Array].
      def get_quotes
        Resources::Quote.parse(request(:get, "quotes/", nil, nil))
      end
    end
  end
end
