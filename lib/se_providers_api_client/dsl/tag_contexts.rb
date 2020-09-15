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

      # GET /api/providers/v1/tag_contexts/{id}
      # Get an tag context. See https://demo.scienceexchange.com/api-docs/providers#/tag_contexts/getProvidersV1TagContextsId
      # @param [Hash] options The options to get a tag context with.
      # @option options [String, Fixnum] :id A tag context ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::TagContext, nil].
      def get_tag_context(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::TagContext.parse(request(:get, "tag_contexts/#{id}"))
      end
    end
  end
end
