# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Facilities
      # GET /api/providers/v1/facilities
      # Get facilities. See https://demo.scienceexchange.com/api-docs/providers#/facilities/getProvidersV1Facilities
      # @return [Array].
      def get_facilities
        Resources::Facility.parse(request(:get, "facilities/", nil, nil))
      end
    end
  end
end
