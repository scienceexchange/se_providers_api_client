# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::RFQCollaborators do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_rfq_collaborators") do
      collection = SeProvidersApiClient.client.get_rfq_collaborators
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/rfq_collaborators
  # Get rfq_collaborators. See https://demo.scienceexchange.com/api-docs/providers#/rfq_collaborators/getProvidersV1RFQCollaborators
  describe "#get_rfq_collaborators" do
    it "returns an array of rfq_collaborators" do
      VCR.use_cassette("get_rfq_collaborators") do
        rfq_collaborators = SeProvidersApiClient.client.get_rfq_collaborators
        expect(rfq_collaborators).to be_a(Array)
        expect(rfq_collaborators.first).to be_a(RFQCollaborator)
      end
    end
  end

  # GET /api/providers/v1/rfq_collaborators/{id}
  # Get a RFQ collaborator. See https://demo.scienceexchange.com/api-docs/providers#/rfq_collaborators/getProvidersV1RFQCollaboratorsId
  describe "#get_rfq_collaborator" do
    it "returns a rfq_collaborator" do
      VCR.use_cassette("get_rfq_collaborator") do
        expect(SeProvidersApiClient.client.get_rfq_collaborator(id: id)).to be_a(RFQCollaborator)
      end
    end
  end
end
