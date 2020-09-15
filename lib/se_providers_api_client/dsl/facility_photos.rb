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
    end
  end
end
