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

      # GET /api/providers/v1/rfq_messages/{id}
      # Get an RFQ message. See https://demo.scienceexchange.com/api-docs/providers#/rfq_messages/getProvidersV1RFQMessagesId
      # @param [Hash] options The options to get a RFQ message with.
      # @option options [String, Fixnum] :id A RFQ message ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::RFQMessage, nil].
      def get_rfq_message(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::RFQMessage.parse(request(:get, "rfq_messages/#{id}"))
      end
    end
  end
end
