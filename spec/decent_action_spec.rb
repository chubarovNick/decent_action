# frozen_string_literal: true

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

      context 'when .handle_execption with exception_class' do
        let(:handler) { double(:custom_hanler) }
        subject { DecentAction.config.exception_handlers }

        before do
          DecentAction.configure do |config|
            config.handle_exception(
              DecentAction::Exception::InvalidError,
              handler
            )
          end
        end

        it { is_expected.not_to be_nil }

        it do
          is_expected.to include(
            DecentAction::Exception::InvalidError => handler
          )
        end
      end
    end
  end
end
