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

      def category_class
        Scalablepress::Service::Category
      end

      def product_class
        Scalablepress::Service::Product
      end
    end
  end
end
