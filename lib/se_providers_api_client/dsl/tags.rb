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

      # GET /api/providers/v1/tags/{id}
      # Get an tag. See https://demo.scienceexchange.com/api-docs/providers#/tags/getProvidersV1TagsId
      # @param [Hash] options The options to get a tag with.
      # @option options [String, Fixnum] :id A tag ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Tag, nil].
      def get_tag(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Tag.parse(request(:get, "tags/#{id}"))
      end
    end
  end
end
