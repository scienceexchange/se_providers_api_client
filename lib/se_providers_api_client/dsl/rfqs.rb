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

      # GET /api/providers/v1/rfqs/{id}
      # Get an RFQ. See https://demo.scienceexchange.com/api-docs/providers#/rfqs/getProvidersV1RFQsId
      # @param [Hash] options The options to get a RFQ with.
      # @option options [String, Fixnum] :id A RFQ ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::RFQ, nil].
      def get_rfq(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::RFQ.parse(request(:get, "rfqs/#{id}"))
      end
    end
  end
end
