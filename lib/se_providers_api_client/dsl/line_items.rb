# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module LineItems
      # GET /api/providers/v1/line_items
      # Get line_items. See https://demo.scienceexchange.com/api-docs/providers#/line_items/getProvidersV1LineItems
      # @return [Array].
      def get_line_items
        Resources::LineItem.parse(request(:get, "line_items/", nil, nil))
      end
    end
  end
end
