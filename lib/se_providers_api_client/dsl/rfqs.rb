# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module RFQs
      # GET /api/providers/v1/rfqs
      # Get rfqs. See https://demo.scienceexchange.com/api-docs/providers#/rfqs/getProvidersV1RFQs
      # @return [Array].
      def get_rfqs
        Resources::RFQ.parse(request(:get, "rfqs/", nil, nil))
      end
    end
  end
end
