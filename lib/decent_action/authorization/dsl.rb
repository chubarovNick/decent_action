module DecentAction
  module Authorization
    module Dsl
      extend ActiveSupport::Concern

      included do
        class_attribute :auth_block

        def need_authorization?
          self.class.auth_block_defined?
        end
      end

      module ClassMethods

        def authorize(&block)
          self.auth_block = block
        end

        def auth_block_defined?
          self.auth_block.present?
        end

      end

    end
  end
end
