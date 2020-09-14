# frozen_string_literal: true

require "se_providers_api_client/errors/client_error"

module SeProvidersApiClient
  module Errors
    class ResourceNotFoundError < ClientError
    end
  end
end
