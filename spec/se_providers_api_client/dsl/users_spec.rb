# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Users do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_users") do
      collection = SeProvidersApiClient.client.get_users
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/users/{id}
  # Get a user. See https://demo.scienceexchange.com/api-docs/providers#/users/getProvidersV1UsersId
  describe "#get_user" do
    it "returns a user" do
      VCR.use_cassette("get_user") do
        expect(SeProvidersApiClient.client.get_user(id: id)).to be_a(User)
      end
    end
  end
end
