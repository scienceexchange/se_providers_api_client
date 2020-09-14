# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Addresses
      # GET /api/providers/v1/addresses
      # Get addresses. See https://demo.scienceexchange.com/api-docs/providers#/addresses/getProvidersV1Addresses
      # @return [Array].
      def get_addresses
        Resources::Address.parse(request(:get, "addresses/", nil, nil))
      end
    end
  end
end
