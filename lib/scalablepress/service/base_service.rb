module Scalablepress
  module Service
    class BaseService
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def build_get_request(klass, params)
        client.get(request_url(klass, params))
      end

      def build_post_request(klass, params)
        client.post(request_url(klass, params), { params: params })
      end

      def build_delete_request(klass, params)
        client.delete(request_url(klass, params), {params: params})
      end

      private

      # Returns class name as collection name
      #
      # @return [<String>]
      def collection_name(klass)
        Utils.resource_class_to_collection_name(klass)
      end

      def singular_name(klass)
        Utils.resource_class_to_singular_name(klass)
      end

      # Build the request uri
      def request_url(klass, params)
        collection = collection_name(klass)
        if params.has_key?(:id) && params.has_key?(:custom_path)
          "#{client.base_url}/#{collection}/#{params[:id]}/#{params[:custom_path]}"
        elsif params.has_key?(:id)
          "#{client.base_url}/#{collection}/#{params[:id]}"
        else
          "#{client.base_url}/#{collection}"
        end
      end
    end
  end
end
