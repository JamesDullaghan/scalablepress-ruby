module Scalablepress
  module Service
    class Product < BaseService
      # List product categories
      # Or list products (in a category)
      # /v2/categories
      # /v2/categories/:id
      def categories(params={})
        collection_name = Utils.resource_class_to_collection_name(category_class)
        @client.get(
          Scalablepress::RequestUri.new(
            client: @client,
            collection_name: collection_name,
            query_params: params
          )
        )
      end

      # List product information
      # /v2/products/:id
      def info(params={})
        collection_name = Utils.resource_class_to_collection_name(product_class)
        @client.get(
          Scalablepress::RequestUri.new(
            client: @client,
            collection_name: collection_name,
            query_params: params
          )
        )
      end

      # List product availability
      # /v2/products/:id/availability
      def availability(params={})
        collection_name = Utils.resource_class_to_collection_name(product_class)
        params = params.merge({ custom_path: 'availability' })
        @client.get(
          Scalablepress::RequestUri.new(
            client: @client,
            collection_name: collection_name,
            query_params: params
          )
        )
      end

      # List specific product details
      # /v2/products/:id/items
      def details(params = {})
        collection_name = Utils.resource_class_to_collection_name(product_class)
        params = params.merge({ custom_path: 'items' })
        @client.get(
          Scalablepress::RequestUri.new(
            client: @client,
            collection_name: collection_name,
            query_params: params
          )
        )
      end


# List product availability
# List detailed item information

      # def make_request(klass)
      #   collection_name = Utils.resource_class_to_collection_name(klass)
      #   if params[:id]
      #     @client.get("#{@client.base_url}/#{collection_name}/#{params[:id]}", {})
      #   else
      #     @client.get("#{@clinet.base_url}/#{collection_name}", params)
      #   end
      # end

      def category_class
        Scalablepress::Service::Category
      end

      def product_class
        Scalablepress::Service::Product
      end
    end
  end
end
