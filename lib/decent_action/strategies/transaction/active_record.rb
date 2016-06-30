module Strategies
  module Transaction
    class ActiveRecord

      def wrap
        ActiveRecord::Base.transaction do
          yield
        end
      end

    end
  end
end