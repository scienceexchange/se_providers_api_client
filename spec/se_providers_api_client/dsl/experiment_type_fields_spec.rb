# frozen_string_literal: true

require "spec_helper"

describe SeProvidersApiClient::DSL::ExperimentTypeFields do
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
end
