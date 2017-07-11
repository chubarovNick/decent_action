# frozen_string_literal: true

module DecentAction
  module Authorization
    # Dsl for action authorization
    module Dsl
      extend ActiveSupport::Concern

      included do
        class_attribute :auth_block

        def need_authorization?
          self.class.auth_block_defined?
        end
      end

      # Dsl for authorize block
      module ClassMethods
        def authorize(&block)
          self.auth_block = block
        end

        def auth_block_defined?
          auth_block.present?
        end
      end
    end
  end
end
