# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Attachments
      # GET /api/providers/v1/attachments
      # Get attachments. See https://demo.scienceexchange.com/api-docs/providers#/attachments/getProvidersV1Attachments
      # @return [Array].
      def get_attachments
        Resources::Attachment.parse(request(:get, "attachments/", nil, nil))
      end

      # GET /api/providers/v1/attachments/{id}
      # Get an attachment. See https://demo.scienceexchange.com/api-docs/providers#/attachments/getProvidersV1AttachmentsId
      # @param [Hash] options The options to get an attachment with.
      # @option options [String, Fixnum] :id An attachment ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Attachment, nil].
      def get_attachment(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Attachment.parse(request(:get, "attachments/#{id}"))
      end
    end
  end
end
