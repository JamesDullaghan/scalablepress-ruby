module Scalablepress
  class Request
    # DEFAULT_HEADERS = {
    #   "Content-Type" => "application/json",
    #   "Accept" => "application/json"
    # }

    DEFAULT_HEADERS = {
      content_type: :json,
      accept: :json
    }

    attr_accessor :path, :response

    def initialize(path, response)
      self.path = path
      self.response = JSON.parse(response)
    end
    # Restclient.http_method
    # url needs http://username:password@url.com
    # url, headers, payload
    # url, headers, payload, block if post

    def self.get(request_url)
      new(
        request_url,
        execute_request(:get, request_url)
      )
    end

    def self.post(request_url, payload)
      new(
        request_url,
        execute_request(:post, request_url, payload)
      )
    end

    def self.delete(request_url, payload)
      new(
        request_url,
        execute_request(:delete, request_url, payload)
      )
    end

    def execute_request(http_method, url, payload={})
      RestClient::Request.new(
        method: method.to_sym,
        url: request_url,
        headers: DEFAULT_HEADERS.merge(payload)
      ).execute
    end
  end
end
