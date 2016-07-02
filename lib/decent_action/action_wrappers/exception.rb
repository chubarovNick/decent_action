module DecentAction
  module ActionWrappers
    class Exception < Base

      def wrap
        begin
          yield
        rescue StandardError => e
          handler = DecentAction.config.exception_handlers[e]
          eval_block_in_context(handler)
        end
      end
    end
  end
end
