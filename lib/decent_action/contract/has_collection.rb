module DecentAction
  module Contract
    module HasCollection
      extend ActiveSupport::Concern

      included do
        class_attribute :collections

        def _collections
          self.class.collections || []
        end

      end

      module ClassMethods

        def collection(name, &block)
          self.collections ||= []
          self.collections << name
          attribute name, Array[build_contract(block)]
          self.validates name, presence: true
        end

      end
    end
  end
end
