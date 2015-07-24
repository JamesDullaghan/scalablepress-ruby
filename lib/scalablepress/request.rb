require 'pry'
require 'httparty'

module Scalablepress
  class Request
    include HTTParty

    attr_accessor :path, :response

    def initialize(path, response)
      self.path = path
      self.response = response
    end

    def self.get(request_uri)
      new(
        request_uri.path,
        HTTParty.get(request_uri.path, request_uri.get_params).parsed_response
      )
    end

    def self.post(request_uri)
      new(
        request_uri.path,
        HTTParty.post(request_uri.path, request_uri.post_params)
      )
    end

    def self.delete(request_uri)
      new(
        request_uri.path,
        HTTParty.delete(request_uri.path, request_uri.delete_params)
      )
    end
  end
end
