# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::FacilityPhotos do
  # GET /api/providers/v1/facility_photos
  # Get facility_photos. See https://demo.scienceexchange.com/api-docs/providers#/facility_photos/getProvidersV1FacilityPhotos
  describe "#get_facility_photos" do
    it "returns an array of facility_photos" do
      VCR.use_cassette("get_facility_photos") do
        facility_photos = SeProvidersApiClient.client.get_facility_photos
        expect(facility_photos).to be_a(Array)
        expect(facility_photos.first).to be_a(FacilityPhoto)
      end
    end
  end
end
