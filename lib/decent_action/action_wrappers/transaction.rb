module DecentActions
  module ActionWrappers
    class Transaction < Base

      def wrap
        yield
      end

    end
  end
end