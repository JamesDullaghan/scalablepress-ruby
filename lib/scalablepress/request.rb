module Scalablepress
  class Request
    DEFAULT_HEADERS = {
      content_type: :json,
      accept: :json
    }

    attr_accessor :path, :response

    def initialize(path, response)
      self.path = path
      self.response = JSON.parse(response)
    end

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

    def self.execute_request(http_method, url, payload={})
      RestClient::Request.new(
        method: http_method.to_sym,
        url: url,
        headers: DEFAULT_HEADERS.merge(payload)
      ).execute
    end
  end
end
