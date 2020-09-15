# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Groups do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_groups") do
      collection = SeProvidersApiClient.client.get_groups
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/groups
  # Get groups. See https://demo.scienceexchange.com/api-docs/providers#/groups/getProvidersV1Groups
  describe "#get_groups" do
    it "returns an array of groups" do
      VCR.use_cassette("get_groups") do
        groups = SeProvidersApiClient.client.get_groups
        expect(groups).to be_a(Array)
        expect(groups.first).to be_a(Group)
      end
    end
  end

  # GET /api/providers/v1/groups/{id}
  # Get a group. See https://demo.scienceexchange.com/api-docs/providers#/groups/getProvidersV1GroupsId
  describe "#get_group" do
    it "returns a group" do
      VCR.use_cassette("get_group") do
        expect(SeProvidersApiClient.client.get_group(id: id)).to be_a(Group)
      end
    end
  end
end
