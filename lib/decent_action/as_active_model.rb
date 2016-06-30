module DecentAction
  module AsActiveModel
    extend ActiveSupport::Concern

    include ActiveModel::Conversion
    include ActiveModel::Validations
    extend ActiveModel::Naming

    def new_record?
      true
    end

    def persisted?
      false
    end

  end
end