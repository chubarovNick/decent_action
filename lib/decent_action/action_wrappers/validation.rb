# frozen_string_literal: true
module DecentAction
  module ActionWrappers
    # Validation wrapper
    class Validation < Base
      def wrap
        contract = action.contract
        raise DecentAction::Exception::InvalidError unless contract.valid?
        yield
      end
    end
  end
end
