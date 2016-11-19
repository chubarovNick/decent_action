# frozen_string_literal: true
module DecentAction
  # Configuration of actions
  class Configuration
    attr_reader :wrappers
    attr_reader :exception_handlers
    attr_reader :actor
    attr_accessor :transaction_strategy
    attr_writer :application_contract

    def initialize
      @wrappers = []
      @exception_handlers = {}
      @transaction_strategy = :activerecord
    end

    def use(wrapper)
      wrappers.tap do |wr|
        wr << wrapper
        wr.uniq!
      end
    end

    def application_contract
      @application_contract || DecentAction::Contract::Base
    end

    def action_actor(actor)
      @actor = actor
    end

    def handle_exception(exception_class, handler)
      exception_handlers[exception_class] = handler
    end
  end
end
