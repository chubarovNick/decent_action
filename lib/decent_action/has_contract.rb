module DecentAction
  module HasContract
    extend ActiveSupport::Concern

    included do
      include Virtus.model
      include DecentAction::Contract

      class_attribute :collections
      class_attribute :objects

      def valid?
        aggregate_collection(:valid?).reduce(super, :&)
      end

      private

      def safe_nested_objects
        (self.class.collections || []) + (self.class.objects || [])
      end

      def aggregate_collection(method)
        safe_nested_objects.map{|col| send(col)}.flatten.compact.map(&method)
      end


    end

    module ClassMethods

      def contract(&block)
        attribute :contract, build_contract(block)
      end

      def object(name, &block)
        self.objects ||= []
        self.objects << name
        attribute name, build_contract(block)
        self.validates name, presence: true
      end

      def collection(name, &block)
        self.collections ||= []
        self.collections << name
        self.validates name, presence: true
        attribute name, Array[build_contract(block)]
      end

    end

  end
end



