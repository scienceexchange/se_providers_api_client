# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::Attachments do
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
end
