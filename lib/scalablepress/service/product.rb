module Scalablepress
  module Service
    class Product < BaseService
      # List product categories
      # Or list products (in a category)
      # /v2/categories
      # /v2/categories/:id
      def categories(params={})
        @categories ||= build_get_request(request_url(category_class, params))
      end

      # List product information
      # /v2/products/:id
      def find(params={})
        @products ||= build_get_request(request_url(product_class, params))
      end

      # List product availability
      # /v2/products/:id/availability
      def availability(params={})
        params = params.merge({ non_restful_path: 'availability' })
        @availability ||= find(params)
      end

      # List specific product details
      # /v2/products/:id/items
      def find_with_details(params = {})
        params = params.merge({ non_restful_path: 'items' })
        @find_with_details ||= find(params)
      end

      private

      # ClassName used for categories
      def category_class
        "Category"
      end

      # ClassName used for products
      def product_class
        "Product"
      end
    end
  end
end
