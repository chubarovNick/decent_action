module DecentAction
  class Configuration
    attr_reader :wrappers
    attr_reader :exception_handlers
    attr_reader :actor
    attr_accessor :transaction_strategy

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

    def set_actor(actor)
      @actor = actor
    end

    def handle_exception(exception_class, handler)
      exception_handlers[exception_class] = handler
    end

  end
end
