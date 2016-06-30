module DecentAction
  module ActionWrappers
    class Validation < Base

      def wrap
        if action.contract.valid?
          yield
        else
          controller.render json: action.contract.errors, status: 422
        end

      end

    end
  end
end