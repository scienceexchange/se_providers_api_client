# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module ExperimentTypeFields
      # GET /api/providers/v1/experiment_type_fields
      # Get experiment_type_fields. See https://demo.scienceexchange.com/api-docs/providers#/experiment_type_fields/getProvidersV1ExperimentTypeFields
      # @return [Array].
      def get_experiment_type_fields
        Resources::ExperimentTypeField.parse(request(:get, "experiment_type_fields/", nil, nil))
      end
    end
  end
end
