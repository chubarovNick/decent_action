# frozen_string_literal: true

module DecentAction
  module Controller
    # Wrapping action in wrappers
    module Wrapper
      extend ActiveSupport::Concern

      included do
        def wrap_action(action_context, &action_performer)
          wrappers = DecentAction.config.wrappers
          wrappers.reverse.reduce action_performer do |result, wrapper|
            wrapper.new(action_context).perform do
              result.call
            end
          end.call
        end
      end
    end
  end
end
