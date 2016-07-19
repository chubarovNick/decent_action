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
           (_objects + _collections).map{|col| send(col)}.flatten.compact.map(&method)
         end

      end
    end
  end
end
