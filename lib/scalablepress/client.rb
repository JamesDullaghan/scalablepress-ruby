module Scalablepress
  class Client
    attr_reader :api_key, :base_url

    # Initialize a Scalablepress object with an api_key
    def initialize(api_key: 'enter-api-key')
      @api_key = api_key
      @base_url = 'https://api.scalablepress.com/v2'
    end

    def auth
      { basic_auth: { username: '', password: api_key } }
    end
  end
end
