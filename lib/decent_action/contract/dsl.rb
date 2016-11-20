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
        def contract(base = nil, &extend_block)
          klass = case base
                  when Class
                    base
                  when NilClass
                    DecentAction::Contract::Base
                  end
          attribute :contract, build_contract(klass, extend_block || proc {})
        end
      end
    end
  end
end
