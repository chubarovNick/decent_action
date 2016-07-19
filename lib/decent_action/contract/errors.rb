module DecentAction
  module Contract
    module Errors
      extend ActiveSupport::Concern

      included do
        def errors_hash
          errors.to_hash.tap do |result|
            _objects.each do |nested_contract_key|
              nested_contract = send(nested_contract_key)
              if nested_contract
                result[nested_contract_key] = nested_contract.errors_hash
              end
            end

            _collections.each do |nested_collection_key|
              nested_collection = send(nested_collection_key)
              if nested_collection
                result[nested_collection_key] = nested_collection.map(&:errors_hash)
              end
            end
          end
        end
      end

    end
  end
end

