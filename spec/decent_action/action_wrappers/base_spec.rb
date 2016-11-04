describe DecentAction::ActionWrappers::Base do
  class WrapperWithoutWrap < DecentAction::ActionWrappers::Base
  end

  describe '#wrap' do
    it 'raise exception if not overrided' do
      expect { WrapperWithoutWrap.new(double(:contrxt)).wrap }.to raise_error('Not implemented')
    end
  end

end
