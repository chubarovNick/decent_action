# frozen_string_literal: true

module DecentAction
  module Contract
    # Base contract implementation
    class Base
      include Virtus.model
      include DecentAction::Contract::HasObject
      include DecentAction::Contract::HasCollection
      include DecentAction::Contract::Validation
      include DecentAction::Contract::ActiveModel
      include DecentAction::Contract::Errors

      def self.model_name
        ::ActiveModel::Name.new(self, nil, 'contract')
      end
    end
  end
end
