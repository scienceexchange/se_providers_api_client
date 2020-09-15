# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::TagContexts do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_tag_contexts") do
      collection = SeProvidersApiClient.client.get_tag_contexts
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/tag_contexts/{id}
  # Get a tag context. See https://demo.scienceexchange.com/api-docs/providers#/tag_contexts/getProvidersV1TagContextsId
  describe "#get_tag_context" do
    it "returns a tag context" do
      VCR.use_cassette("get_tag_context") do
        expect(SeProvidersApiClient.client.get_tag_context(id: id)).to be_a(TagContext)
      end
    end
  end
end
