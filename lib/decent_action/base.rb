# frozen_string_literal: true
module DecentAction
  # Base action class
  class Base
    include DecentAction::Authorization::Dsl
    include DecentAction::Contract::Dsl

    attr_reader :result

    def initialize(params_hash)
      self.contract = params_hash
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
      contract.errors.empty?
    end

    def failure?
      !success?
    end
  end
end
