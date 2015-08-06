module Scalablepress
  module Service
    class Quote < BaseService
      # GET /v2/quote/:id (orderToken)
      def retrieve(params={})
        @retrieve ||= build_get_request(request_url(quote_class, params))
      end

      # parameters should be setup as
      # POST /v2/quote
      def standard(params={})
        @standard ||= build_post_request(request_url(quote_class, params, false))
      end

      # Bulk endpoint is used when submitting multiple items for quotes
      # POST /v2/quote/bulk
      def bulk(params={})
        params = params.merge({ custom_path: 'bulk' })
        @bulk ||= build_post_request(request_url(quote_class, params, false))
      end

      private

      def quote_class
        "Quote"
      end
    end
  end
end
