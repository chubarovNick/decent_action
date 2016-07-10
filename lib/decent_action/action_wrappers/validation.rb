module DecentAction
  module ActionWrappers
    class Validation < Base

      def wrap
        if action.contract.valid?
          yield
        else
          raise DecentAction::Exception::InvalidError
        end

      end

    end
  end
end
