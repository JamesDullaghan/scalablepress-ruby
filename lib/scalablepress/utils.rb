module Scalablepress
  module Utils
    class << self
      def pluralize(str)
        return str.gsub(/y$/, 'ies') if str =~ /y$/
        "#{str}s"
      end

      def resource_class_to_singular_name(resource_class)
        resource_class.to_s.split('::')[-1].downcase
      end

      def resource_class_to_collection_name(resource_class)
        Utils.pluralize(resource_class_to_singular_name(resource_class))
      end
    end
  end
end
