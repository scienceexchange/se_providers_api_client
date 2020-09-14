require 'se_providers_api_client'

module SeProvidersApiClient
  module DSL
  end
end

require 'se_providers_api_client/dsl/depositions'
require 'se_providers_api_client/dsl/deposition_files'
require 'se_providers_api_client/dsl/deposition_actions'
require 'se_providers_api_client/utils'
require 'mime-types'

module SeProvidersApiClient
  module DSL
    include Depositions
    include DepositionFiles
    include DepositionActions
    include Utils
  end
end

