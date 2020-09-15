# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module RFQFields
      # GET /api/providers/v1/rfq_fields
      # Get rfq_fields. See https://demo.scienceexchange.com/api-docs/providers#/rfq_fields/getProvidersV1RFQFields
      # @return [Array].
      def get_rfq_fields
        Resources::RFQField.parse(request(:get, "rfq_fields/", nil, nil))
      end
    end
  end
end
