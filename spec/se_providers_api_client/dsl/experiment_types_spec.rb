# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::ExperimentTypes do
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
end
