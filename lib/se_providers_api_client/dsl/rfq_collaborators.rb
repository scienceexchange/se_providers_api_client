# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module RFQCollaborators
      # GET /api/providers/v1/rfq_collaborators
      # Get rfq_collaborators. See https://demo.scienceexchange.com/api-docs/providers#/rfq_collaborators/getProvidersV1RFQCollaborators
      # @return [Array].
      def get_rfq_collaborators
        Resources::RFQCollaborator.parse(request(:get, "rfq_collaborators/", nil, nil))
      end

      # GET /api/providers/v1/rfq_collaborators/{id}
      # Get an RFQ collaborator. See https://demo.scienceexchange.com/api-docs/providers#/rfq_collaborators/getProvidersV1RFQCollaboratorsId
      # @param [Hash] options The options to get a RFQ collaborator with.
      # @option options [String, Fixnum] :id A RFQ collaborator ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::RFQCollaborator, nil].
      def get_rfq_collaborator(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::RFQCollaborator.parse(request(:get, "rfq_collaborators/#{id}"))
      end
    end
  end
end
