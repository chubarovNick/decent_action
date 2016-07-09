module DecentAction
  module Contract
    module Validation
      extend ActiveSupport::Concern
      included do

        def valid?
          aggregate_collection(:valid?).reduce(super, :&)
        end

        private

         def aggregate_collection(method)
           safe_nested_objects.map{|col| send(col)}.flatten.compact.map(&method)
         end

      end
    end
  end
end
