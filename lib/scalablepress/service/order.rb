module Scalablepress
  module Service
    class Order
      # POST /v2/order
      def place_order(params={})
        @place_order ||= build_post_request(
          request_url(order_class, params, false)
        )
      end

      # POST /v2/order/:id/reprint
      def reprint(params={})
        params = params.merge({ non_restful_path: 'reprint' })
        @reprint ||= build_post_request(
          request_url(order_class, params, false)
        )
      end

      # GET /v2/order
      # GET /v2/order/:id
      def retrieve(params={})
        @retrieve ||= build_get_request(request_url(order_class, params, false))
      end

      # GET /v2/order/:id
      def status(params={})
        @status ||= retrieve(params).status
      end

      # GET /v2/order/:id
      def events(params={})
        @events ||= retrieve(params).events
      end

      # GET /v1/order/:id/changeAddress
      # SCALABLEPRESS IS USING THE WRONG HTTP VERB IN THE API
      def change_address(params={})
        params = params.merge({ non_restful_path: 'changeAddress' })
        @change_address ||= retrieve(params)
      end

      # DELETE /v2/order/:id
      def cancel(params={})
        @cancel ||= build_delete_request(request_url(order_class, params, false))
      end

      private

      # Class Name used for orders
      def order_class
        "Order"
      end
    end
  end
end
