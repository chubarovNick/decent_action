# frozen_string_literal: true
describe DecentAction::Configuration do
  let(:configuration) { DecentAction::Configuration.new }
  subject { configuration }

  it { is_expected.to respond_to(:actor) }

  it { is_expected.to respond_to(:wrappers) }

  it { is_expected.to respond_to(:exception_handlers) }
end
