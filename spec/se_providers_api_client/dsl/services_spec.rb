# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Services do
  # GET /api/providers/v1/services
  # Get services. See https://demo.scienceexchange.com/api-docs/providers#/services/getProvidersV1Services
  describe "#get_services" do
    it "returns an array of services" do
      VCR.use_cassette("get_services") do
        services = SeProvidersApiClient.client.get_services
        expect(services).to be_a(Array)
        expect(services.first).to be_a(Service)
      end
    end
  end
end
