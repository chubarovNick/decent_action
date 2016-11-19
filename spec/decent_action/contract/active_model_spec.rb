# frozen_string_literal: true
describe DecentAction::Contract::ActiveModel do
  let(:action) { StubAction.new(title: 'Title') }

  it 'define new_record? for contract' do
    expect(action.contract.new_record?).to eq(true)
  end

  it 'define persisted? for contract' do
    expect(action.contract.persisted?).to eq(false)
  end
end
