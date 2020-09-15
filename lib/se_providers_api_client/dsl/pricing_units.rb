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
    end
  end
end
