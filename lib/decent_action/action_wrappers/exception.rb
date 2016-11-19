# frozen_string_literal: true
module DecentAction
  module ActionWrappers
    # Exception handler wrapper
    class Exception < Base
      def wrap
        yield
      rescue StandardError => e
        handler = DecentAction.config.exception_handlers[e.class]
        handler ? eval_block_in_context(handler) : raise(e)
      end
    end
  end
end
