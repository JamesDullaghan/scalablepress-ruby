module Scalablepress
  module Service
    class Product < BaseService
      # List product categories
      # Or list products (in a category)
      # /v2/categories
      # /v2/categories/:id
      def categories(params={})
        @categories ||= build_get_request(category_class, params)
      end

      # List product information
      # /v2/products/:id
      def all(params={})
        @products ||= build_get_request(product_class, params)
      end

      # List product availability
      # /v2/products/:id/availability
      def availability(params={})
        params = params.merge({ custom_path: 'availability' })
        @availability ||= build_get_request(product_class, params)
      end

      # List specific product details
      # /v2/products/:id/items
      def find(params = {})
        params = params.merge({ custom_path: 'items' })
        @details ||= build_get_request(product_class, params)
      end

      def category_class
        "Category"
        # Scalablepress::Service::Category
      end

      def product_class
        "Product"
        # Scalablepress::Service::Product
      end
    end
  end
end
