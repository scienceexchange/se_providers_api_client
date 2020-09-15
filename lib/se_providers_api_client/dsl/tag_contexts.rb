# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module TagContexts
      # GET /api/providers/v1/tag_contexts
      # Get tag_contexts. See https://demo.scienceexchange.com/api-docs/providers#/tag_contexts/getProvidersV1TagContexts
      # @return [Array].
      def get_tag_contexts
        Resources::TagContext.parse(request(:get, "tag_contexts/", nil, nil))
      end
    end
  end
end
