# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Tags do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_tags") do
      collection = SeProvidersApiClient.client.get_tags
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/tags/{id}
  # Get a tag. See https://demo.scienceexchange.com/api-docs/providers#/tags/getProvidersV1TagsId
  describe "#get_tag", skip: "TODO" do
    it "returns a tag" do
      VCR.use_cassette("get_tag") do
        expect(SeProvidersApiClient.client.get_tag(id: id)).to be_a(Tag)
      end
    end
  end
end
