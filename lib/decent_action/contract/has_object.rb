# frozen_string_literal: true
module DecentAction
  module Contract
    # Dsl for defining nested object within contracts
    module HasObject
      extend ActiveSupport::Concern

      included do
        class_attribute :objects

        def _objects
          self.class.objects || []
        end
      end

      # Class Methods
      module ClassMethods
        def object(name, klass = DecentAction::Contract::Base, &block)
          self.objects ||= []
          self.objects << name
          attribute name, build_contract(klass, block)
          validates name, presence: true
        end
      end
    end
  end
end
