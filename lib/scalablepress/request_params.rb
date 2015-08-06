module Scalablepress
  class RequestParams
    attr_accessor :klass, :params, :collection

    def initialize(args={})
      @klass = args.fetch(:klass)
      @params = args.fetch(:params) { {} }
      @collection = args.fetch(:collection) { true }
    end

    def resource_name
      @resource_name ||= collection ? collection_class : singular_class
    end

    def url
      if id_with_path?
        "#{resource_name}/#{params[:id]}/#{params[:non_restful_path]}"
      elsif id?
        "#{resource_name}/#{params[:id]}"
      else
        "#{resource_name}"
      end
    end

    private

    def collection_class
      Utils.resource_class_to_collection_name(klass)
    end

    def singular_class
      Utils.resource_class_to_singular_name(klass)
    end

    def id?
      params.has_key?(:id)
    end

    def id_with_path?
      id? && params.has_key?(:non_restful_path)
    end
  end
end
