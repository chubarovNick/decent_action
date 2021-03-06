# frozen_string_literal: true

describe DecentAction::Authorization::Dsl do
  before do
    DecentAction.configure do |config|
      config.action_actor :user
    end
  end

  class ActionWithAuth < DecentAction::Base
    contract do
      attribute :title, String
    end

    authorize(&:admin?)

    def perform
      contract.title
    end
  end

  describe '.authorize' do
    let(:title) { 'Title' }

    let(:context) do
      DecentAction::Context.new(ActionWithAuth, self, title: title)
    end

    before { expect(context).to receive(:authorize).and_call_original }

    subject { context.run }

    context 'when actor has permission for action' do
      let(:user) { double(:actor, admin?: true) }

      it { is_expected.to eq(title) }
    end

    context 'when actor has no permission for action' do
      let(:user) { double(:actor, admin?: false) }

      before { expect(user).to receive(:admin?) }

      specify 'exception raised' do
        expect do
          subject
        end.to raise_error(DecentAction::Exception::PermissionCheckError)
      end
    end
  end
end
