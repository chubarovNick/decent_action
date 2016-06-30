module DecentAction
  module ActionWrappers
    class Base
      class << self
        def wrap
          raise 'Not implemented'
        end

        def perform(&block)
          Proc.new do
            wrap do
              block.call
            end
          end
        end
      end
    end
  end
end