module DecentAction
  module Contract
    module Build
      extend ActiveSupport::Concern

      module ClassMethods

        def build_contract(block)
          contract_class = Class.new do
            include Virtus.model
            include DecentAction::Contract::Build
            include DecentAction::Contract::HasObject
            include DecentAction::Contract::HasCollection
            include DecentAction::Contract::Validation
            include DecentAction::Contract::ActiveModel
            include DecentAction::Contract::Errors

            def self.model_name
              ::ActiveModel::Name.new(self, nil, 'contract')
            end

          end

          contract_class.instance_eval(&block)
          contract_class
        end

      end
    end
  end
end

