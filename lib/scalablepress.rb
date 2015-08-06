require 'rest-client'
require 'json'

# Version
require_relative 'scalablepress/version'
require_relative 'scalablepress/client'
require_relative 'scalablepress/request'
require_relative 'scalablepress/utils'
require_relative 'scalablepress/service/base_service'
require_relative 'scalablepress/service/product'
require_relative 'scalablepress/service/quote'

##
# Scalable Press is a vertically integrated print and fulfillment service
#
# This library provides ruby bindings for the Scalable Press API (https://scalablepress.com/docs/)
module Scalablepress
end

client = Scalablepress::Client.new(api_key: 'test_V_ip47s_XBdD_O5-mYs1WA')
# response = client.products.categories.response
# puts response


