# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Tags do
  # GET /api/providers/v1/tags
  # Get tags. See https://demo.scienceexchange.com/api-docs/providers#/tags/getProvidersV1Tags
  describe "#get_tags", skip: 'TODO' do
    it "returns an array of tags" do
      VCR.use_cassette("get_tags") do
        tags = SeProvidersApiClient.client.get_tags
        expect(tags).to be_a(Array)
        expect(tags.first).to be_a(Tag)
      end
    end
  end
end
