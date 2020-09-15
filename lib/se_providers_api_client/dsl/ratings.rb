# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Ratings
      # GET /api/providers/v1/ratings
      # Get ratings. See https://demo.scienceexchange.com/api-docs/providers#/ratings/getProvidersV1Ratings
      # @return [Array].
      def get_ratings
        Resources::Rating.parse(request(:get, "ratings/", nil, nil))
      end

      # GET /api/providers/v1/ratings/{id}
      # Get an rating. See https://demo.scienceexchange.com/api-docs/providers#/ratings/getProvidersV1RatingsId
      # @param [Hash] options The options to get a rating with.
      # @option options [String, Fixnum] :id A rating ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Rating, nil].
      def get_rating(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Rating.parse(request(:get, "ratings/#{id}"))
      end
    end
  end
end
