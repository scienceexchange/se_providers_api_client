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
    end
  end
end
