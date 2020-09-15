# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Ratings do
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
end
