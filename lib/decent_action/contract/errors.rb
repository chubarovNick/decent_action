# frozen_string_literal: true
module DecentAction
  module Contract
    # Collect erors form all contract
    module Errors
      extend ActiveSupport::Concern

      included do
        def errors_hash
          errors.to_hash.tap do |result|
            result.merge!(objects_errors)
            result.merge!(collection_errors)
          end
        end

        private

        def collection_errors
          {}.tap do |result|
            _collections.each do |collection_key|
              item = send(collection_key)
              result[collection_key] = item.map(&:errors_hash) if item
            end
          end
        end

        def objects_errors
          {}.tap do |result|
            _objects.each do |object_key|
              object = send(object_key)
              result[object_key] = object.errors_hash if object
            end
          end
        end
      end
    end
  end
end
