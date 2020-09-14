# frozen_string_literal: true

require "se_providers_api_client/version"

module SeProvidersApiClient
  autoload :Client, "se_providers_api_client/client"
  autoload :DSL, "se_providers_api_client/dsl"
  autoload :Resources, "se_providers_api_client/resources"
  autoload :Errors, "se_providers_api_client/errors"
  autoload :Utils, "se_providers_api_client/utils"

  class << self
    # @return [String]
    attr_accessor :api_key
    attr_accessor :url
    attr_accessor :logger
  end

  self.url = "https://www.scienceexchange.com/api/providers/v1/"

  module_function

  # @return [SeProvidersApiClient::Client]
  def client
    @client ||= Client.new(SeProvidersApiClient.api_key, SeProvidersApiClient.url)
  end
end
