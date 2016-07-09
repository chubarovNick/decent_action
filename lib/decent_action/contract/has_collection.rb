module DecentAction
  module Contract
    module HasCollection
      extend ActiveSupport::Concern

      included do
        class_attribute :collections
      end

      module ClassMethods

        def collection(name, &block)
          self.collections ||= []
          self.collections << name
          self.validates name, presence: true
          attribute name, Array[build_contract(block)]
        end

      end
    end
  end
end
