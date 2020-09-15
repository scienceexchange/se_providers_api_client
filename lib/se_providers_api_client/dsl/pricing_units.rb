# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module PricingUnits
      # GET /api/providers/v1/pricing_units
      # Get pricing_units. See https://demo.scienceexchange.com/api-docs/providers#/pricing_units/getProvidersV1PricingUnits
      # @return [Array].
      def get_pricing_units
        Resources::PricingUnit.parse(request(:get, "pricing_units/", nil, nil))
      end

      # GET /api/providers/v1/pricing_units/{id}
      # Get an pricing unit. See https://demo.scienceexchange.com/api-docs/providers#/pricing_units/getProvidersV1PricingUnitsId
      # @param [Hash] options The options to get a pricing unit with.
      # @option options [String, Fixnum] :id A pricing unit ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::PricingUnit, nil].
      def get_pricing_unit(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::PricingUnit.parse(request(:get, "pricing_units/#{id}"))
      end
    end
  end
end
