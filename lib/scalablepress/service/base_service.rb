module Scalablepress
  module Service
    class BaseService
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def build_post_request(klass, params)
        @client.post(request_uri(klass, params))
      end

      def build_get_request(klass, params)
        @client.get(request_uri(klass, params))
      end

      private

      # Returns class name as collection name
      #
      # @return [<String>]
      def collection_name(klass)
        Utils.resource_class_to_singular_name(klass)
      end

      def request_uri(klass, params)
        Scalablepress::RequestUri.new(
          client: @client,
          collection_name: collection_name(klass),
          query_params: params
        )
      end
    end
  end
end
