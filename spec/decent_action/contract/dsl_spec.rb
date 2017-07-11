# frozen_string_literal: true

describe DecentAction::Contract::Dsl do
  context '.contract' do
    context 'allow pass contract blueprint' do
      class BluePrintContract < DecentAction::Contract::Base
        attribute :blue, String, default: 'Hello'
      end

      class ActionWitContract < DecentAction::Base
        contract BluePrintContract do
          attribute :another_param, String
          object :hello do
            attribute :world, String
          end
          collection :nested_params do
            attribute :id, Integer
          end
        end
      end

      subject { ActionWitContract.new({}).contract }

      it { is_expected.to respond_to(:blue) }

      it { is_expected.to respond_to(:another_param) }

      context 'data to params' do
        subject do
          ActionWitContract.new(blue: 'New blue',
                                another_param: 'Another param',
                                hello: {
                                  world: 'Hello world'
                                },
                                nested_params: [{ id: 1 }, { id: 2 }]).contract
        end

        it 'correctly process params' do
          contract = subject
          expect(contract.blue).to eq('New blue')
          expect(contract.another_param).to eq('Another param')
          expect(contract.hello.world).to eq('Hello world')
          expect(contract.nested_params[0].id).to eq(1)
          expect(contract.nested_params[1].id).to eq(2)
        end
      end
    end
  end
end
