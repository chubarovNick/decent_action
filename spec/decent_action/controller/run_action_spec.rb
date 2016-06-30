class StubAction < DecentAction::Base
  contract do
    attribute :title
  end

  def perform
    "Awesome #{contract.title}"
  end

end

class ControllerStub
  include DecentAction::Controller::RunAction

  def action
    run StubAction, {title: 'Gem'} do |interaction|
      interaction.result
    end
  end
end

class SampleWrapper < DecentAction::ActionWrappers::Base
  class << self
    def wrap
      yield
    end
  end
end

class ExceptionWrapper < DecentAction::ActionWrappers::Base
  class << self

    def wrap
      begin
        yield
      rescue  StandardError
        return 'Error raised'
      end
    end

  end
end


describe DecentAction::Controller::RunAction do
  before { DecentAction.reset_config }

  describe '#run' do
    subject { ControllerStub.new.action }


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

        before { expect(SampleWrapper).to receive(:wrap).and_call_original }

        it { is_expected.to eq('Awesome Gem') }
      end

      context 'when wrapper track exception' do
        before do
          DecentAction.configure do |config|
            config.use(ExceptionWrapper)
          end
        end

        before { expect(ExceptionWrapper).to receive(:wrap).and_call_original }

        context 'and no exception raised' do

          it { is_expected.to eq('Awesome Gem') }

        end

        context 'and exception raised' do
          before { allow_any_instance_of(StubAction).to receive(:perform).and_raise(StandardError) }

          it { is_expected.to eq('Error raised') }

        end

      end

    end

  end
end