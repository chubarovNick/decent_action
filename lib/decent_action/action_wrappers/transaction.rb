module DecentActions
  module ActionWrappers
    class Transaction < Base

      def wrap
        strategy_config = DecentAction.config.transaction_strategy
        strategy = "DecentAction::Strategies::Transaction#{strategy_config.camelize}".constantize
        strategy.new.wrap do
          yield
        end
      end

    end
  end
end
