# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::FacilityMembers do
  # GET /api/providers/v1/facility_members
  # Get facility_members. See https://demo.scienceexchange.com/api-docs/providers#/facility_members/getProvidersV1FacilityMembers
  describe "#get_facility_members" do
    it "returns an array of facility_members" do
      VCR.use_cassette("get_facility_members") do
        facility_members = SeProvidersApiClient.client.get_facility_members
        expect(facility_members).to be_a(Array)
        expect(facility_members.first).to be_a(FacilityMember)
      end
    end
  end
end
