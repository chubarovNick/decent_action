# frozen_string_literal: true

module DecentAction
  module Contract
    # Dsl for build contact class
    module Build
      extend ActiveSupport::Concern

      # Class Methods
      module ClassMethods
        def build_contract(block)
          contract_class = Class.new DecentAction::Contract::Base do
            include DecentAction::Contract::Build
          end
          contract_class.instance_eval(&block)
          contract_class
        end
      end
    end
  end
end
