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
      binding.pry
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



{
  "type"=>"dtg",
  "products"=> {
    "id"=>"gildan-sweatshirt-crew",
    "color"=>"ash",
    "quantity"=>"12"
  },
  "address"=> {
    "name"=>"My customer",
    "address1"=>"123 Scalable Drive.",
    "city"=>"West Pressfield"
  },
 "basic_auth"=>{"username"=>"", "password"=>"test_V_ip47s_XBdD_O5-mYs1WA"},
 "headers"=>{"Content-Type"=>"application/json"}
}
