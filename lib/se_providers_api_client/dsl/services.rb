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

      # GET /api/providers/v1/services/{id}
      # Get an service. See https://demo.scienceexchange.com/api-docs/providers#/services/getProvidersV1ServicesId
      # @param [Hash] options The options to get a service with.
      # @option options [String, Fixnum] :id A service ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Service, nil].
      def get_service(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Service.parse(request(:get, "services/#{id}"))
      end
    end
  end
end
