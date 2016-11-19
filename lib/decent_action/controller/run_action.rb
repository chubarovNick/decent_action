# frozen_string_literal: true
module DecentAction
  module Controller
    # Action Runner
    module RunAction
      extend ActiveSupport::Concern

      included do
        include DecentAction::Controller::Wrapper

        def run(action_class, params)
          action_context = DecentAction::Context.new(action_class, self, params)

          wrap_action(action_context) do
            action_context.run
            yield(action_context.action)
          end
        end
      end
    end
  end
end
