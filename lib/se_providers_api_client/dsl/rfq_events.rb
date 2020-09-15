# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module RFQEvents
      # GET /api/providers/v1/rfq_events
      # Get rfq_events. See https://demo.scienceexchange.com/api-docs/providers#/rfq_events/getProvidersV1RFQEvents
      # @return [Array].
      def get_rfq_events
        Resources::RFQEvent.parse(request(:get, "rfq_events/", nil, nil))
      end

      # WARN: RFQ events have no unique identifiers. It is only possible to
      # obtain all events for an RFQ using the index endpoint. There is no
      # API endpoint for retrieving individual events.
      def get_rfq_event(_options = {})
        Raise NotImplementedError
      end
    end
  end
end
