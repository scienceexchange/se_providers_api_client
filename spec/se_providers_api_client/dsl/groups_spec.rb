# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Groups do
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
end
