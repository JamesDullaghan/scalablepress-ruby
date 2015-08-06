module Scalablepress
  module Service
    class Quote < BaseService
      def retrieve(params={})
        build_get_request(quote_class, params)
      end

      def standard(params={})
        build_post_request(quote_class, params)
      end

      def bulk(params={})
        params = params.merge({ custom_path: 'bulk' })
        build_post_request(quote_class, params)
      end

      private

      def quote_class
        "Quote"
      end
    end
  end
end
