# frozen_string_literal: true

module DecentAction
  module Contract
    # Add ActiveModel behaviour
    module ActiveModel
      extend ActiveSupport::Concern

      include ::ActiveModel::Conversion
      include ::ActiveModel::Validations
      extend ::ActiveModel::Naming

      def new_record?
        true
      end

      def persisted?
        false
      end
    end
  end
end
