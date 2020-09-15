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

      # GET /api/providers/v1/quotes/{id}
      # Get an quote. See https://demo.scienceexchange.com/api-docs/providers#/quotes/getProvidersV1QuotesId
      # @param [Hash] options The options to get a quote with.
      # @option options [String, Fixnum] :id A quote ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Quote, nil].
      def get_quote(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Quote.parse(request(:get, "quotes/#{id}"))
      end
    end
  end
end
