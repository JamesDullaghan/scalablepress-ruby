require 'pry'

module Scalablepress
  module Service
    class BaseService
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def build_get_request(url)
        client.get(url).response
      end

      def build_post_request(url)
        client.post(url, { params: params }).response
      end

      def build_delete_request(url)
        client.delete(url, { params: params }).response
      end

      protected

      def request_url(klass, params, collection=true)
        url = Scalablepress::RequestParams.new({
          klass: klass,
          params: params,
          collection: collection
        }).url
        "#{client.base_url}/#{url}"
      end

      private

      def klass_name(klass, collection=true)
        if collection
          Utils.resource_class_to_collection_name(klass)
        else
          Utils.resource_class_to_singular_name(klass)
        end
      end
    end
  end
end
