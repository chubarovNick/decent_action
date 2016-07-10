module DecentAction
  module Wrapper
    extend ActiveSupport::Concern


    included do

      def wrap_action(action_context, &action_performer)
        DecentAction.config.wrappers.reduce action_performer do |result, wrapper|
          wrapper.new(action_context).perform do
            result.call
          end
        end.call
      end
    end
  end
end
