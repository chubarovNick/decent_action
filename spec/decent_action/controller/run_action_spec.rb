# frozen_string_literal: true
describe DecentAction::Controller::RunAction do
  let(:controller) { ControllerStub.new }
  before do
    allow(controller).to receive(:params) { { title: 'Gem' } }
  end

  class SampleWrapper < DecentAction::ActionWrappers::Base
    def wrap
      yield
    end
  end

  class ExceptionWrapper < DecentAction::ActionWrappers::Base
    def wrap
      yield
    rescue StandardError
      return 'Error raised'
    end
  end

  before { DecentAction.reset_config }

  describe '#run' do
    subject { controller.action }

    context 'when no wrappers are setup' do
      it { is_expected.to eq('Awesome Gem') }
    end

    context 'when wrappers are setup' do
      context 'and wraper do nothing' do
        before do
          DecentAction.configure do |config|
            config.use(SampleWrapper)
          end
        end

        before do
          expect_any_instance_of(SampleWrapper).to receive(:wrap)
            .and_call_original
        end

        it { is_expected.to eq('Awesome Gem') }
      end

      context 'when wrapper track exception' do
        before do
          DecentAction.configure do |config|
            config.use(ExceptionWrapper)
            config.use(SampleWrapper)
          end
        end

        before do
          expect_any_instance_of(ExceptionWrapper).to receive(:wrap)
            .and_call_original

          expect_any_instance_of(SampleWrapper).to receive(:wrap)
            .and_call_original
        end

        context 'and no exception raised' do
          it { is_expected.to eq('Awesome Gem') }
        end

        context 'and exception raised' do
          before do
            allow_any_instance_of(StubAction).to receive(:perform)
              .and_raise(StandardError)
          end

          it { is_expected.to eq('Error raised') }
        end
      end
    end
  end
end
