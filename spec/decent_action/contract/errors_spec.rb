# frozen_string_literal: true
describe DecentAction::Contract::Errors do
  class ActionWithComplecsValidations < DecentAction::Base
    contract do
      attribute :title, String
      validates :title, presence: true

      object :user do
        attribute :email, String
        validates :email, presence: true
      end

      collection :numbers do
        attribute :number, Integer
        validates :number, presence: true
      end
    end
  end

  let(:action) { ActionWithComplecsValidations.new(params) }

  before { action.valid? }
  subject { action.contract.errors_hash }

  context '#errors_hash' do
    context 'first level validations' do
      let(:params) { { title: nil } }

      it 'include to errors_hash' do
        expect(subject.key?(:title)).to be_truthy
      end
    end

    context 'objects' do
      let(:params) { { title: nil, user: { email: nil } } }

      it 'include to errors_hash' do
        expect(subject.key?(:user)).to be_truthy
        expect(subject[:user].key?(:email)).to be_truthy
      end
    end

    context 'collections' do
      let(:params) do
        { title: nil, user: { email: nil }, numbers: [{ number: nil }] }
      end

      it 'include to errors_hash' do
        expect(subject.key?(:numbers)).to be_truthy
      end
    end
  end
end
