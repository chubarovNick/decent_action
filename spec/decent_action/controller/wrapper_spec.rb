# frozen_string_literal: true

describe DecentAction::Controller::Wrapper do
  before { DecentAction.reset_config }

  before do
    DecentAction.configure do |config|
      config.use(DecentAction::ActionWrappers::Exception)
      config.use(DecentAction::ActionWrappers::Validation)
      config.handle_exception(DecentAction::Exception::InvalidError, proc do
        validation_error_handler
      end)
    end
  end

  let(:controller) { ControllerStub.new }

  before do
    expect_any_instance_of(
      DecentAction::ActionWrappers::Exception
    ).to receive(:wrap).and_call_original

    expect_any_instance_of(
      DecentAction::ActionWrappers::Validation
    ).to receive(:wrap).and_call_original
  end

  subject { controller.action }

  context 'when action fail Validation stage' do
    before do
      allow(controller).to receive(:params) { { title: nil } }
    end

    it { is_expected.to eq('error_handled') }
  end
end
