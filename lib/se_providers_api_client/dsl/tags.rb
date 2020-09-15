# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Tags
      # GET /api/providers/v1/tags
      # Get tags. See https://demo.scienceexchange.com/api-docs/providers#/tags/getProvidersV1Tags
      # @return [Array].
      def get_tags
        Resources::Tag.parse(request(:get, "tags/", nil, nil))
      end
    end
  end
end
