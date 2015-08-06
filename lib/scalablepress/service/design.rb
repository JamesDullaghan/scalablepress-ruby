module Scalablepress
  module Service
    class Design
      # POST /v2/design
      def create(params={})
        @create ||= build_post_request(request_url(design_class, params, false))
      end

      # POST /v2/design
      def resize(params={})
        @resize ||= create(params)
      end

      # GET /v2/design/:id
      def retrieve(params={})
        @retrieve ||= build_get_request(request_url(design_class, params, false))
      end

      # DELETE /v2/design/:id
      def delete(params={})
        @delete ||= build_delete_request(request_url(design_class, params, false))
      end


      private

      def design_class
        "Design"
      end
    end
  end
end
