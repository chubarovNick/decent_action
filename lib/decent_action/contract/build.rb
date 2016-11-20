# frozen_string_literal: true

module DecentAction
  module Contract
    # Dsl for build contact class
    module Build
      extend ActiveSupport::Concern

      # Class Methods
      module ClassMethods
        def build_contract(klass, block = nil)
          contract_class = Class.new klass do
            include DecentAction::Contract::Build
          end
          contract_class.instance_exec(&block)
          contract_class
        end
      end
    end
  end
end
