# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::TagContexts do
  # GET /api/providers/v1/tag_contexts
  # Get tag_contexts. See https://demo.scienceexchange.com/api-docs/providers#/tag_contexts/getProvidersV1TagContexts
  describe "#get_tag_contexts" do
    it "returns an array of tag_contexts" do
      VCR.use_cassette("get_tag_contexts") do
        tag_contexts = SeProvidersApiClient.client.get_tag_contexts
        expect(tag_contexts).to be_a(Array)
        expect(tag_contexts.first).to be_a(TagContext)
      end
    end
  end
end
