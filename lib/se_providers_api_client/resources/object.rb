require "delegate"
require "json"
require "time"

module SeProvidersApiClient
  module Resources
    class Object < SimpleDelegator
      require "se_providers_api_client/resources/object/serializers"
      require "se_providers_api_client/resources/object/attributes"

      include Serializers
      include Attributes

      # Define common attributes, applicable to different resources
      attribute :created_at, Time
      attribute :updated_at, Time

      def inspect
        "#<#{self.class.name}:#{"0x00%x" % (object_id << 1)} #{inspect_attributes}>"
      end

      private

      def inspect_attributes
        attributes.map { |key, value| "@#{key}=#{value.inspect}" }.join(" ")
      end
    end
  end
end
