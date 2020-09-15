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

      # GET /api/providers/v1/line_items/{id}
      # Get an line item. See https://demo.scienceexchange.com/api-docs/providers#/line_items/getProvidersV1LineItemsId
      # @param [Hash] options The options to get a line item with.
      # @option options [String, Fixnum] :id A line item ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::LineItem, nil].
      def get_line_item(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::LineItem.parse(request(:get, "line_items/#{id}"))
      end
    end
  end
end
