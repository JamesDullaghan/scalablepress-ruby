module Scalablepress
  module Service
    class Reship
      # GET /v2/reship
      # GET /v2/reship/:id
      def retrieve(params={})
        build_get_request(request_url(reship_class, params, false))
      end

      # POST /v2/reship/:id/request
      def request(params={})
        params = params.merge({ non_restful_path: 'request' })
        build_post_request(request_url(reship_class, params, false))
      end

      # POST /v2/reship/:id/cancel
      def cancel(params={})
        params = params.merge({ non_restful_path: 'cancel' })
        build_delete_request(request_url(reship_class, params, false))
      end

      private

      def reship_class
        "Reship"
      end
    end
  end
end
