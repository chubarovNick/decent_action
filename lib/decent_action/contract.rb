module DecentAction
  module Contract
    extend ActiveSupport::Concern

    included do
      include Virtus.model
      include DecentAction::AsActiveModel
      include DecentAction::HasContract
    end


    module ClassMethods
      def build_contract(block)
        contract_class = Class.new do
          include DecentAction::Contract

          def self.model_name
            ActiveModel::Name.new(self, nil, 'contract')
          end

        end

        contract_class.instance_eval &block
        contract_class
      end

    end

  end
end
