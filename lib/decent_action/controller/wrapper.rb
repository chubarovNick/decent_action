module DecentAction
  module Wrapper
    extend ActiveSupport::Concern


    included do

      def wrap_action(&action_performer)
        DecentAction.config.wrappers.reduce action_performer do |result, wrapper|
          wrapper.new(self).perform do
            result.call
          end
        end.call
      end
    end
  end
end
