# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module FacilityPhotos
      # GET /api/providers/v1/facility_photos
      # Get facility_photos. See https://demo.scienceexchange.com/api-docs/providers#/facility_photos/getProvidersV1FacilityPhotos
      # @return [Array].
      def get_facility_photos
        Resources::FacilityPhoto.parse(request(:get, "facility_photos/", nil, nil))
      end

      # GET /api/providers/v1/facility_photos/{id}
      # Get an facility photo. See https://demo.scienceexchange.com/api-docs/providers#/facility_photos/getProvidersV1FacilityPhotosId
      # @param [Hash] options The options to get a facility photo with.
      # @option options [String, Fixnum] :id A facility photo ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::FacilityPhoto, nil].
      def get_facility_photo(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::FacilityPhoto.parse(request(:get, "facility_photos/#{id}"))
      end
    end
  end
end
