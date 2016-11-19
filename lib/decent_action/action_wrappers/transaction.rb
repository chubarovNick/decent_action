# frozen_string_literal: true
module DecentActions
  module ActionWrappers
    # Transaction wrapper
    class Transaction < Base
      def wrap
        strategy.new.wrap do
          yield
        end
      end

      private

      def strategy
        strategy_name = DecentAction.config.transaction_strategy.camelize
        strategy_class = "DecentAction::Strategies::Transaction#{strategy_name}"
        strategy_class.constantize
      end
    end
  end
end
