module DecentAction
  module ActionWrappers
    class Exception < Base

      def wrap
        begin
          yield
        rescue StandardError => e
          handler = DecentAction.config.exception_handlers[e.class]
          handler ? eval_block_in_context(handler) : raise(e)
        end
      end
    end
  end
end
