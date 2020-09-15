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

      # GET /api/providers/v1/users/{id}
      # Get an user. See https://demo.scienceexchange.com/api-docs/providers#/users/getProvidersV1UsersId
      # @param [Hash] options The options to get a user with.
      # @option options [String, Fixnum] :id A user ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::User, nil].
      def get_user(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::User.parse(request(:get, "users/#{id}"))
      end
    end
  end
end
