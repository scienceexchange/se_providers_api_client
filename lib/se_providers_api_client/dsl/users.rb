# frozen_string_literal: true

require "se_providers_api_client/dsl"

module SeProvidersApiClient
  module DSL
    module Users
      # GET /api/providers/v1/users
      # Get users. See https://demo.scienceexchange.com/api-docs/providers#/users/getProvidersV1Users
      # @return [Array].
      def get_users
        Resources::User.parse(request(:get, "users/", nil, nil))
      end
    end
  end
end
