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

      # GET /api/providers/v1/facilities/{id}
      # Get an facility. See https://demo.scienceexchange.com/api-docs/providers#/facilities/getProvidersV1FacilitiesId
      # @param [Hash] options The options to get a facility with.
      # @option options [String, Fixnum] :id A facility ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Facility, nil].
      def get_facility(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Facility.parse(request(:get, "facilities/#{id}"))
      end
    end
  end
end
