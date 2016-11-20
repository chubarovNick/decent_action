# frozen_string_literal: true
module DecentAction
  module Contract
    # Add collection dsl for define collections within contracts
    module HasCollection
      extend ActiveSupport::Concern

      included do
        class_attribute :collections

        def _collections
          self.class.collections || []
        end
      end
      # Class Methods
      module ClassMethods
        def collection(name, klass = DecentAction::Contract::Base, &block)
          self.collections ||= []
          self.collections << name
          attribute name, Array[build_contract(klass, block)]
          validates name, presence: true
        end
      end
    end
  end
end
