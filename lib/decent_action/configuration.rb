module DecentAction
  class Configuration
    attr_accessor :wrappers

    def initialize
      self.wrappers = []
    end

    def use(wrapper)
      wrappers.tap do |wr|
        wr << wrapper
        wr.uniq!
      end
    end

  end
end