# frozen_string_literal: true
module DecentAction
  module Contract
    # Contract DSL
    module Dsl
      extend ActiveSupport::Concern

      included do
        include Virtus.model
        include DecentAction::Contract::Build
      end

      # Class methods
      module ClassMethods
        def contract(&block)
          attribute :contract, build_contract(block)
        end
      end
    end
  end
end
