require 'spec_helper'

module Scalablepress
  describe Client do
    let(:api_key) { 'myapikey'                   }
    let(:client)  { Client.new(api_key: api_key) }

    it 'should set the base url' do
      client.base_url.must_equal("https://:myapikey@api.scalablepress.com/v2")
    end
  end
end
