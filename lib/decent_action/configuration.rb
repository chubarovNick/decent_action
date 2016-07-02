module DecentAction
  class Configuration
    attr_reader :wrappers
    attr_reader :exception_handlers

    def initialize
      @wrappers = []
      @exception_handlers = {}
    end

    def use(wrapper)
      wrappers.tap do |wr|
        wr << wrapper
        wr.uniq!
      end
    end

    def handle_exception(exception_class, handler)
      exception_handlers[exception_class] = handler
    end

  end
end
