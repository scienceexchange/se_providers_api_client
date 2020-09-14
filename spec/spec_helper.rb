# frozen_string_literal: true

require "webmock/rspec"
require "se_providers_api_client"
require "vcr"
include SeProvidersApiClient::Resources

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))
cnf = YAML.load_file(File.join(APP_ROOT, "config/gem_secret.yml"))
se_providers_api_key = cnf["se_providers_api_key"]

API_TEST_HOST = "https://demo.scienceexchange.com/api/providers/v1/"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data("<SE_PROVIDERS_API_KEY>") { se_providers_api_key }
end

RSpec.configure do |config|
  config.before do
    SeProvidersApiClient.api_key = se_providers_api_key
    SeProvidersApiClient.url = API_TEST_HOST
  end
end
