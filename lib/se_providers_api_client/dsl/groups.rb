# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Groups
      # GET /api/providers/v1/groups
      # Get groups. See https://demo.scienceexchange.com/api-docs/providers#/groups/getProvidersV1Groups
      # @return [Array].
      def get_groups
        Resources::Group.parse(request(:get, "groups/", nil, nil))
      end
    end
  end
end
