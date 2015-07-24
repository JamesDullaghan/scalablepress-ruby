module Scalablepress
  module Service
    class Product < BaseService
      def categories(params)
        collection_name = Utils.resource_class_to_collection_name(category_class)
        if params[:id]
          @client.get(
            Scalablepress::RequestUri.new(
              client: @client,
              collection_name: collection_name,
              object_id: params[:id],
              query_params: params
            )
          )
        else
          @client.get(
            Scalablepress::RequestUri.new(
              client: @client,
              collection_name: collection_name,
              query_params: params
            )
          )
          # @client.get("#{@client.base_url}/#{collection_name}", { query: params })
        end
      end

      def list(params)
        collection_name = Utils.resource_class_to_collection_name(product_class)
        if params[:id]
          @client.get("#{@client.base_url}/#{collection_name}/#{params[:id]}", { query: {} })
        else
          @client.get("#{@clinet.base_url}/#{collection_name}", { query: params })
        end
      end

# List product categories
# List products (in a category)
# List product information
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
