# frozen_string_literal: true

require "faraday"
require "json"
require "openssl"
require "active_support/all"
require "se_providers_api_client/dsl"
require "se_providers_api_client/errors"
require "se_providers_api_client/utils"

module SeProvidersApiClient
  class Client
    include DSL
    include Errors
    include Utils

    REQUESTS = %i[get post put delete].freeze
    HEADERS = { "Accept" => "application/json", "Content-Type" => "application/json" }.freeze

    # @param [String] api_key
    def initialize(api_key = SeProvidersApiClient.api_key, url = SeProvidersApiClient.url)
      @api_key = api_key
      @url = url

      # Setup HTTP request connection to SeProvidersApiClient.
      @connection ||= Faraday.new do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.response :logger if SeProvidersApiClient.logger
        builder.adapter Faraday.default_adapter
      end
    end

    # @param [:get, :post, :put, :delete] method.
    # @param [String] path.
    # @param [Hash] query (optional).
    # @param [Hash] headers request headers (optional).
    # @raise [ArgumentError] If the response is blank.
    # @raise [ResourceNotFoundError] If the response code is 404.
    # @raise [ClientError] If the response code is not in the success range.
    # @return [Faraday::Response] server response.
    def request(method, path, query = {}, headers = HEADERS)
      msg = "Unsupported method #{method.inspect}. Only :get, :post, :put, :delete are allowed"
      raise ArgumentError, msg unless REQUESTS.include?(method)

      token_url = UrlHelper.build_url(path: "#{@url}#{path}", params: { access_token: @api_key })
      payload = nil
      if query.present?
        accept = headers.present? ? headers["Accept"] : nil
        payload = if accept.present? && accept == "application/json"
                    JSON.generate(query)
                  else
                    query
                  end
      end
      response = @connection.run_request(method, token_url, payload, headers)

      case response.status.to_i
      when 200..299
        response
      when 404
        raise ResourceNotFoundError.new(method: method, url: token_url, headers: headers, response: response)
      else
        raise ClientError.new(method: method, url: token_url, headers: headers, response: response)
      end
    end
  end
end
