# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Services do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_services") do
      collection = SeProvidersApiClient.client.get_services
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

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

  # GET /api/providers/v1/services/{id}
  # Get a service. See https://demo.scienceexchange.com/api-docs/providers#/services/getProvidersV1ServicesId
  describe "#get_service" do
    it "returns a service" do
      VCR.use_cassette("get_service") do
        expect(SeProvidersApiClient.client.get_service(id: id)).to be_a(Service)
      end
    end
  end
end
