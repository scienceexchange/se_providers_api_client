# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Addresses
      # GET /api/providers/v1/addresses
      # Get addresses. See https://demo.scienceexchange.com/api-docs/providers#/addresses/getProvidersV1Addresses
      # @return [Array].
      def get_addresses
        Resources::Address.parse(request(:get, "addresses/", nil, nil))
      end

      # GET /api/providers/v1/addresses/{id}
      # Get an address. See https://demo.scienceexchange.com/api-docs/providers#/addresses/getProvidersV1AddressesId
      # @param [Hash] options The options to get an address with.
      # @option options [String, Fixnum] :id An address ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Address, nil].
      def get_address(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Address.parse(request(:get, "addresses/#{id}"))
      end
    end
  end
end
