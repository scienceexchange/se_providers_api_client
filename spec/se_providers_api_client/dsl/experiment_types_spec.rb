# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::ExperimentTypes do
  let(:id) do
    # WARN: This ID relies on the index endpoint returning at least one record.
    # You may need to populate data in Science Exchange in order for the test to work.
    VCR.use_cassette("get_experiment_types") do
      collection = SeProvidersApiClient.client.get_experiment_types
      id = collection.first.try(:[], "id")
      id || 1
    end
  end

  # GET /api/providers/v1/experiment_types
  # Get experiment_types. See https://demo.scienceexchange.com/api-docs/providers#/experiment_types/getProvidersV1ExperimentTypes
  describe "#get_experiment_types" do
    it "returns an array of experiment_types" do
      VCR.use_cassette("get_experiment_types") do
        experiment_types = SeProvidersApiClient.client.get_experiment_types
        expect(experiment_types).to be_a(Array)
        expect(experiment_types.first).to be_a(ExperimentType)
      end
    end
  end

  # GET /api/providers/v1/experiment_types/{id}
  # Get an experiment type. See https://demo.scienceexchange.com/api-docs/providers#/experiment_types/getProvidersV1ExperimentTypesId
  describe "#get_experiment_type" do
    it "returns an experiment_type" do
      VCR.use_cassette("get_experiment_type") do
        expect(SeProvidersApiClient.client.get_experiment_type(id: id)).to be_a(ExperimentType)
      end
    end
  end
end
