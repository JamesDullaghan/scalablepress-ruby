module Scalablepress
  module Service
    class Product < BaseService
      # List product categories
      # Or list products (in a category)
      # /v2/categories
      # /v2/categories/:id
      def categories(params={})
        build_get_request(category_class, params)
      end

      # List product information
      # /v2/products/:id
      def info(params={})
        build_get_request(product_class, params)
      end

      # List product availability
      # /v2/products/:id/availability
      def availability(params={})
        params = params.merge({ custom_path: 'availability' })
        build_get_request(product_class, params)
      end

      # List specific product details
      # /v2/products/:id/items
      def details(params = {})
        params = params.merge({ custom_path: 'items' })
        build_get_request(product_class, params)
      end

      def build_get_request(klass, params)
        @client.get(
          Scalablepress::RequestUri.new(
            client: @client,
            collection_name: collection_name(klass),
            query_params: params
          )
        )
      end

      def collection_name(klass)
        Utils.resource_class_to_collection_name(klass)
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
