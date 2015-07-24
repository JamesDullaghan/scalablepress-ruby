module Scalablepress
  class RequestUri
    attr_accessor :client,
                  :base_url,
                  :collection_name,
                  :object_id,
                  :query_params

    def initialize(args)
      @client = args.fetch(:client)
      @base_url = @client.base_url
      @collection_name = args.fetch(:collection_name)
      @object_id = args.fetch(:object_id) { nil }
      @query_params = args.fetch(:query_params) { { } }
    end

    def path
      if object_id
        "#{base_url}/#{collection_name}/#{object_id}"
      else
        "#{base_url}/#{collection_name}"
      end
    end

    def post_params
      query_params_with_auth.merge(json_header)
    end

    def query_params_with_auth
      query_params.merge(auth)
    end

    alias_method :get_params, :query_params_with_auth
    alias_method :delete_params, :query_params_with_auth

    private

    def auth
      {
        basic_auth: {
          username: '',
          password: client.api_key
        }
      }
    end

    def json_header
      { headers: { "Content-Type" => "application/json" } }
    end
  end
end
