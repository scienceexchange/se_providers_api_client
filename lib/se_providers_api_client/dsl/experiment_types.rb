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

      # GET /api/providers/v1/experiment_types/{id}
      # Get an experiment type. See https://demo.scienceexchange.com/api-docs/providers#/experiment_types/getProvidersV1ExperimentTypesId
      # @param [Hash] options The options to get an experiment type with.
      # @option options [String, Fixnum] :id An experiment type ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::ExperimentType, nil].
      def get_experiment_type(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::ExperimentType.parse(request(:get, "experiment_types/#{id}"))
      end
    end
  end
end
