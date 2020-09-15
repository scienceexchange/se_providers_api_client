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
    end
  end
end
