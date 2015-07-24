module Scalablepress
  module Service
    class BaseService
      attr_reader :client

      def initialize(client)
        @client = client
      end
    end
  end
end
