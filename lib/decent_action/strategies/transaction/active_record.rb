# frozen_string_literal: true
module Strategies
  module Transaction
    # ActiveRecord transaction strategy
    class ActiveRecord
      def wrap
        ActiveRecord::Base.transaction do
          yield
        end
      end
    end
  end
end
