module Scalablepress
  class Client
    attr_reader :base_url

    class << self
    end

    def initialize(api_key: 'my_api_key')
      @api_key = api_key
      @base_url = 'https://api.scalablepress.com'
      @rate_limit_details = {}
    end

    def get(path, params)
      execute_request Scalablepress::Request.get(path, params)
    end

    def post(path, payload_hash)
      execute_request Scalablepress::Request.post(path, payload_hash)
    end

    def delete(path, payload_hash)
      execute_request Scalablepress::Request.delete(path, payload_hash)
    end

    private

    def execute_request(request)
      request = request.execute(base_url, api_key: api_key)
      @rate_limit_details = request.rate_limit_details
      request
    end

    attr_reader :api_key, :base_url
  end
end
