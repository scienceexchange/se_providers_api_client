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

      # GET /api/providers/v1/quote_versions/{id}
      # Get an quote version. See https://demo.scienceexchange.com/api-docs/providers#/quote_versions/getProvidersV1QuoteVersionsId
      # @param [Hash] options The options to get a quote version with.
      # @option options [String, Fixnum] :id A quote version ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::QuoteVersion, nil].
      def get_quote_version(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::QuoteVersion.parse(request(:get, "quote_versions/#{id}"))
      end
    end
  end
end
