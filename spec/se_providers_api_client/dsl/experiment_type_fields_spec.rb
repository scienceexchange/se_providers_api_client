# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::ExperimentTypeFields do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_experiment_type_fields") do
      collection = SeProvidersApiClient.client.experiment_type_fields
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/experiment_type_fields
  # Get experiment_type_fields. See https://demo.scienceexchange.com/api-docs/providers#/experiment_type_fields/getProvidersV1ExperimentTypeFields
  describe "#get_experiment_type_fields" do
    it "returns an array of experiment_type_fields" do
      VCR.use_cassette("get_experiment_type_fields") do
        experiment_type_fields = SeProvidersApiClient.client.get_experiment_type_fields
        expect(experiment_type_fields).to be_a(Array)
        expect(experiment_type_fields.first).to be_a(ExperimentTypeField)
      end
    end
  end

  # GET /api/providers/v1/experiment_type_fields/{id}
  # Get an experiment type field. See https://demo.scienceexchange.com/api-docs/providers#/experiment_type_fields/getProvidersV1ExperimentTypeFieldsId
  describe "#get_experiment_type_field", skip: "TODO" do
    it "returns an experiment_type_field" do
      VCR.use_cassette("get_experiment_type_field") do
        expect(SeProvidersApiClient.client.get_experiment_type_field(id: id)).to be_a(ExperimentTypeField)
      end
    end
  end
end
