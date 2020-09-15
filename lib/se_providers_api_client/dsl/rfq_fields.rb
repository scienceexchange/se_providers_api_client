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

      # GET /api/providers/v1/rfq_fields/{id}
      # Get an RFQ field. See https://demo.scienceexchange.com/api-docs/providers#/rfq_fields/getProvidersV1RFQFieldsId
      # @param [Hash] options The options to get a RFQ field with.
      # @option options [String, Fixnum] :id A RFQ field ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::RFQField, nil].
      def get_rfq_field(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::RFQField.parse(request(:get, "rfq_fields/#{id}"))
      end
    end
  end
end
