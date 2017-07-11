# frozen_string_literal: true

describe DecentAction::ActionWrappers::Base do
  class WrapperWithoutWrap < DecentAction::ActionWrappers::Base
  end

  describe '#wrap' do
    it 'raise exception if not overrided' do
      expect do
        WrapperWithoutWrap.new(double(:contrxt)).wrap
      end.to raise_error('Not implemented')
    end
  end
end
