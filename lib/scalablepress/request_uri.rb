module Scalablepress
  class RequestUri
    attr_accessor :client,
                  :base_url,
                  :collection_name,
                  :query_params

    def initialize(args)
      @client = args.fetch(:client)
      @base_url = @client.base_url
      @collection_name = args.fetch(:collection_name)
      @query_params = args.fetch(:query_params) { { } }
    end

    def path
      if query_params.has_key?(:id) && query_params.has_key?(:custom_path)
        "#{base_url}/#{collection_name}/#{query_params[:id]}/#{query_params[:custom_path]}"
      elsif query_params.has_key?(:id)
        "#{base_url}/#{collection_name}/#{query_params[:id]}"
      else
        "#{base_url}/#{collection_name}"
      end
    end

    def post_params
      query_params_with_auth
    end

    def query_params_with_auth
      {
        "body" => [query_params].to_json,
        "basic_auth" => auth,
        "headers" => json_header
      }
    end

    alias_method :get_params, :query_params_with_auth
    alias_method :delete_params, :query_params_with_auth

    private

    def auth
      { "username" => "", "password" => client.api_key.to_s }
    end

    def json_header
      { "Content-Type" => "application/json", "Accept" => 'application/json' }
    end
  end
end
