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

      # GET /api/providers/v1/groups/{id}
      # Get an group. See https://demo.scienceexchange.com/api-docs/providers#/groups/getProvidersV1GroupsId
      # @param [Hash] options The options to get a group with.
      # @option options [String, Fixnum] :id A group ID.
      # @raise [ArgumentError] If the :id is blank
      # @return [SeProvidersApiClient::Resources::Group, nil].
      def get_group(options = {})
        id = options[:id] || raise(ArgumentError, "Must supply :id")
        Resources::Group.parse(request(:get, "groups/#{id}"))
      end
    end
  end
end
