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
    end
  end
end
