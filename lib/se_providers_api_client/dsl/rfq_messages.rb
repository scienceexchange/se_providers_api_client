# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module RFQMessages
      # GET /api/providers/v1/rfq_messages
      # Get rfq_messages. See https://demo.scienceexchange.com/api-docs/providers#/rfq_messages/getProvidersV1RFQMessages
      # @return [Array].
      def get_rfq_messages
        Resources::RFQMessage.parse(request(:get, "rfq_messages/", nil, nil))
      end
    end
  end
end
