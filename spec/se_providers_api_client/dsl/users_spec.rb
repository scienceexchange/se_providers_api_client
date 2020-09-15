# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Users do
  # GET /api/providers/v1/users
  # Get users. See https://demo.scienceexchange.com/api-docs/providers#/users/getProvidersV1Users
  describe "#get_users" do
    it "returns an array of users" do
      VCR.use_cassette("get_users") do
        users = SeProvidersApiClient.client.get_users
        expect(users).to be_a(Array)
        expect(users.first).to be_a(User)
      end
    end
  end
end
