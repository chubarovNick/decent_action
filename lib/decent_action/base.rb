module DecentAction
  class Base
    include DecentAction::HasContract

    attr_reader :result

    def initialize(contract)
      self.contract = contract
    end

    def perform
      raise 'Not implemented'
    end

    def run
      @result = perform
    end

    def valid?
      contract.valid?
    end

    def success?
      errors.empty?
    end

    def failure?
      !success?
    end

  end
end
