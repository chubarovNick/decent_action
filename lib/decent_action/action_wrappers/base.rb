module DecentAction
  module ActionWrappers
    class Base
      attr_reader :execution_context

      def initialize(execution_context)
        @execution_context = execution_context
      end

      def wrap
        raise 'Not implemented'
      end

      def perform(&block)
        Proc.new do
          wrap do
            block.call
          end
        end
      end

      private

      def eval_block_in_context(handler)
        execution_context.instance_eval(&handler)
      end

    end
  end
end
