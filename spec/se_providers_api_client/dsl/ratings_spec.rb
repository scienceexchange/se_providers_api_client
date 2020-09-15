# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Ratings do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_ratings") do
      collection = SeProvidersApiClient.client.get_ratings
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/ratings
  # Get ratings. See https://demo.scienceexchange.com/api-docs/providers#/ratings/getProvidersV1Ratings
  describe "#get_ratings" do
    it "returns an array of ratings" do
      VCR.use_cassette("get_ratings") do
        ratings = SeProvidersApiClient.client.get_ratings
        expect(ratings).to be_a(Array)
        expect(ratings.first).to be_a(Rating)
      end
    end
  end

  # GET /api/providers/v1/ratings/{id}
  # Get a rating. See https://demo.scienceexchange.com/api-docs/providers#/ratings/getProvidersV1RatingsId
  describe "#get_rating" do
    it "returns a rating" do
      VCR.use_cassette("get_rating") do
        expect(SeProvidersApiClient.client.get_rating(id: id)).to be_a(Rating)
      end
    end
  end
end
