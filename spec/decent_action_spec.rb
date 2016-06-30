require 'spec_helper'

describe DecentAction do

  it 'has a version number' do
    expect(DecentAction::VERSION).not_to be nil
  end


  describe '.configuration' do
    before { DecentAction.reset_config }
    subject { DecentAction.config }

    it { is_expected.not_to be_nil }

    describe '.configure' do

      context 'when .use with wrapper class' do

        let(:wrapper) {  double(:wrapper) }

        before do
          DecentAction.configure do |config|
            config.use(wrapper)
          end
        end

        specify 'should include wrapper' do
          expect(subject.wrappers).to include(wrapper)
        end



      end

    end


  end

end
