# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module FacilityMembers
      # GET /api/providers/v1/facility_members
      # Get facility_members. See https://demo.scienceexchange.com/api-docs/providers#/facility_members/getProvidersV1FacilityMembers
      # @return [Array].
      def get_facility_members
        Resources::FacilityMember.parse(request(:get, "facility_members/", nil, nil))
      end
    end
  end
end
