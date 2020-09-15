# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::FacilityMembers do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_facility_members") do
      collection = SeProvidersApiClient.client.get_facility_members
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/facility_members/{id}
  # Get a facility member. See https://demo.scienceexchange.com/api-docs/providers#/facility_members/getProvidersV1FacilityMembersId
  describe "#get_facility_member" do
    it "returns a facility_member" do
      VCR.use_cassette("get_facility_member") do
        expect(SeProvidersApiClient.client.get_facility_member(id: id)).to be_a(FacilityMember)
      end
    end
  end
end
