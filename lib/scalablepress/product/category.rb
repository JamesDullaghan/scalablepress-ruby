require 'httparty'

module Scalablepress
  class Category < Client
    # Categories JSON
    def categories
      @categories ||= HTTParty.get("#{base_url}/categories", auth).parsed_response
    end

    # Category list
    #
    # @return [<Array>]
    def category_options
      @category_options ||= categories.map { |category| category["name"] }
    end

    #
    def category(id='sweatshirts')
      HTTParty.get("#{base_url}/categories/#{id}", auth).parsed_response
    end
  end
end
