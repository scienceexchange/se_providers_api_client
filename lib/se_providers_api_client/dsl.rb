# frozen_string_literal: true

require "se_providers_api_client"

module SeProvidersApiClient
  module DSL
  end
end

require "se_providers_api_client/dsl/addresses"
require "se_providers_api_client/dsl/attachments"
require "se_providers_api_client/dsl/currency_codes"
require "se_providers_api_client/dsl/experiment_type_fields"
require "se_providers_api_client/dsl/experiment_types"
require "se_providers_api_client/dsl/facilities"
require "se_providers_api_client/dsl/facility_members"
require "se_providers_api_client/dsl/facility_photos"
require "se_providers_api_client/dsl/groups"
require "se_providers_api_client/dsl/line_items"
require "se_providers_api_client/dsl/pricing_units"
require "se_providers_api_client/dsl/quote_versions"
require "se_providers_api_client/dsl/quotes"
require "se_providers_api_client/dsl/ratings"
require "se_providers_api_client/dsl/rfq_collaborators"
require "se_providers_api_client/dsl/rfq_events"
require "se_providers_api_client/dsl/rfq_fields"
require "se_providers_api_client/dsl/rfq_messages"
require "se_providers_api_client/dsl/rfqs"
require "se_providers_api_client/dsl/services"
require "se_providers_api_client/dsl/tag_contexts"
require "se_providers_api_client/dsl/tags"
require "se_providers_api_client/dsl/users"
require "se_providers_api_client/utils"
require "mime-types"

module SeProvidersApiClient
  module DSL
    include Addresses
    include Attachments
    include CurrencyCodes
    include ExperimentTypeFields
    include ExperimentTypes
    include Facilities
    include FacilityMembers
    include FacilityPhotos
    include Groups
    include LineItems
    include PricingUnits
    include QuoteVersions
    include Quotes
    include Ratings
    include RFQCollaborators
    include RFQEvents
    include RFQFields
    include RFQMessages
    include RFQs
    include Services
    include TagContexts
    include Tags
    include Users
    include Utils
  end
end
