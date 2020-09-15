# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Services
      # GET /api/providers/v1/services
      # Get services. See https://demo.scienceexchange.com/api-docs/providers#/services/getProvidersV1Services
      # @return [Array].
      def get_services
        Resources::Service.parse(request(:get, "services/", nil, nil))
      end
    end
  end
end
