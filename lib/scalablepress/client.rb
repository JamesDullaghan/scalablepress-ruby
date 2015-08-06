module Scalablepress
  class Client
    attr_reader :api_key

    # Initialize a Scalablepress object with an api_key
    def initialize(api_key: 'enter-api-key')
      @api_key = api_key
    end

    def base_url
      @base_url ||= "https://:#{api_key}@api.scalablepress.com/v2"
    end

    def products
      Scalablepress::Service::Product.new(self)
    end

    def quotes
      Scalablepress::Service::Quote.new(self)
    end

    def get(request_url)
      Scalablepress::Request.get(request_url)
    end

    def post(request_url, payload)
      Scalablepress::Request.post(request_url, payload)
    end

    def delete(request_url)
      Scalablepress::Request.delete(request_url)
    end

    private

    def request_class
      Scalablepress::Request
    end
  end
end
