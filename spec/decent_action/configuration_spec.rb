# frozen_string_literal: true
describe DecentAction::Configuration do
  let(:configuration) { DecentAction::Configuration.new }
  subject { configuration }

  it { is_expected.to respond_to(:actor) }

  it { is_expected.to respond_to(:wrappers) }

  it { is_expected.to respond_to(:exception_handlers) }

  it { is_expected.to respond_to(:application_contract) }

  context '#application_contract' do
    subject { configuration.application_contract }

    context 'default value' do
      it { is_expected.to eq(DecentAction::Contract::Base) }
    end
  end
end
