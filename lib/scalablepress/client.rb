module Scalablepress
  class Client
    attr_reader :api_key, :base_url

    # Initialize a Scalablepress object with an api_key
    def initialize(api_key: 'enter-api-key')
      @api_key = api_key
      @base_url = 'https://api.scalablepress.com/v2'
    end

    def products
      Scalablepress::Service::Product.new(self)
    end

    def get(request_uri)
      request_class.get(request_uri)
    end

    def post(request_uri)
      request_class.post(request_uri)
    end

    def delete(request_uri)
      request_class.delete(request_uri)
    end

    private

    def request_class
      Scalablepress::Request
    end
  end
end
