module DecentAction
  module Controller
    module RunAction
      extend ActiveSupport::Concern

      included do
        include DecentAction::Wrapper

        def run(action_class, params)
          interaction = action_class.new(params)

          wrap_action do
            interaction.run
            yield(interaction)
          end
        end

      end

    end
  end
end