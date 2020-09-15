# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Attachments do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_attachments") do
      collection = SeProvidersApiClient.client.get_attachments
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/attachments
  # Get attachments. See https://demo.scienceexchange.com/api-docs/providers#/attachments/getProvidersV1Attachments
  describe "#get_attachments" do
    it "returns an array of attachments" do
      VCR.use_cassette("get_attachments") do
        attachments = SeProvidersApiClient.client.get_attachments
        expect(attachments).to be_a(Array)
        expect(attachments.first).to be_a(Attachment)
      end
    end
  end

  # GET /api/providers/v1/attachments/{id}
  # Get an attachment. See https://demo.scienceexchange.com/api-docs/providers#/attachments/getProvidersV1AttachmentsId
  describe "#get_attachment" do
    it "returns an attachment" do
      VCR.use_cassette("get_attachment") do
        expect(SeProvidersApiClient.client.get_attachment(id: id)).to be_a(Attachment)
      end
    end
  end
end
