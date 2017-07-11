# frozen_string_literal: true

describe DecentAction::ActionWrappers::Validation do
  let(:action_scope) { double(:action_scope) }

  class FooAction < DecentAction::Base
    contract do
      attribute :title, String
      validates :title, presence: true
    end
    def perform
      contract.title
    end
  end

  let(:execution_context) do
    DecentAction::Context.new(FooAction, action_scope, title: title)
  end

  let(:wrapper) { described_class.new(execution_context) }

  describe '#wrap' do
    let(:wrap) do
      wrapper.wrap do
        execution_context.action.perform
      end
    end

    subject { wrap }

    context 'when action valid' do
      let(:title) { 'Title' }

      it { is_expected.to eq('Title') }
    end

    context 'when action invalid' do
      let(:title) { nil }

      specify do
        expect { wrap }.to raise_error(DecentAction::Exception::InvalidError)
      end
    end
  end
end
