# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::FacilityPhotos do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_facility_photos") do
      collection = SeProvidersApiClient.client.get_facility_photos
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/facility_photos/{id}
  # Get a facility photo. See https://demo.scienceexchange.com/api-docs/providers#/facility_photos/getProvidersV1FacilityPhotosId
  describe "#get_facility_photo" do
    it "returns a facility_photo" do
      VCR.use_cassette("get_facility_photo") do
        expect(SeProvidersApiClient.client.get_facility_photo(id: id)).to be_a(FacilityPhoto)
      end
    end
  end
end
