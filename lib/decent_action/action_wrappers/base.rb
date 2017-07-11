# frozen_string_literal: true

module DecentAction
  module ActionWrappers
    # Base functionality for wrapper objects
    class Base
      attr_reader :execution_context

      def initialize(execution_context)
        @execution_context = execution_context
      end

      def wrap
        raise 'Not implemented'
      end

      def perform
        proc do
          wrap do
            yield
          end
        end
      end

      def action
        execution_context.action
      end

      private

      def eval_block_in_context(handler)
        scope = execution_context.action_scope
        scope.instance_exec(execution_context.action, &handler)
      end
    end
  end
end
