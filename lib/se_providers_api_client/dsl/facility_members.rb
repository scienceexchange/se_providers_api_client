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

      # GET /api/providers/v1/facility_members/{id}
      # Get an facility member. See https://demo.scienceexchange.com/api-docs/providers#/facility_members/getProvidersV1FacilityMembersId
      # @param [Hash] options The options to get a facility member with.
      # @option options [String, Fixnum] :id A facility member ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::FacilityMember, nil].
      def get_facility_member(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::FacilityMember.parse(request(:get, "facility_members/#{id}"))
      end
    end
  end
end
