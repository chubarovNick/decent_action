module DecentAction
  module Contract
    module HasObject
      extend ActiveSupport::Concern

      included do
        class_attribute :objects
      end

      module ClassMethods
        def object(name, &block)
          self.objects ||= []
          self.objects << name
          attribute name, build_contract(block)
          self.validates name, presence: true
        end
 
      end
    end
  end
end
