module DecentAction
  module Contract
    module Errors
      extend ActiveSupport::Concern

      included do
        def errors_hash
          errors.to_hash.tap do |result|
            safe_nested_objects.each do |nested_contract_key|
              nested_contract = send(nested_contract_key)
              if nested_contract
                result[nested_contract_key] = send(nested_contract_key).errors_hash
              end
            end
          end
        end
      end

    end
  end
end

