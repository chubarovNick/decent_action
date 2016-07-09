module DecentAction
  module Contract
    module Dsl
      extend ActiveSupport::Concern

      included do
        include Virtus.model
        include DecentAction::Contract::Build
      end

      module ClassMethods

        def contract(&block)
          attribute :contract, build_contract(block)
        end

      end
    end
  end
end
