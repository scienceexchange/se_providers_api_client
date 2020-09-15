# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module ExperimentTypes
      # GET /api/providers/v1/experiment_types
      # Get experiment_types. See https://demo.scienceexchange.com/api-docs/providers#/experiment_types/getProvidersV1ExperimentTypes
      # @return [Array].
      def get_experiment_types
        Resources::ExperimentType.parse(request(:get, "experiment_types/", nil, nil))
      end
    end
  end
end
