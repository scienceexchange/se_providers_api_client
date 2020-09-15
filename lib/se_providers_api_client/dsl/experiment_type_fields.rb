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

      # GET /api/providers/v1/experiment_type_fields/{id}
      # Get an experiment type field. See https://demo.scienceexchange.com/api-docs/providers#/experiment_type_fields/getProvidersV1ExperimentTypeFieldsId
      # @param [Hash] options The options to get an experiment type field with.
      # @option options [String, Fixnum] :id An experiment type field ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::ExperimentTypeField, nil].
      def get_experiment_type_field(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::ExperimentTypeField.parse(request(:get, "experiment_type_fields/#{id}"))
      end
    end
  end
end
