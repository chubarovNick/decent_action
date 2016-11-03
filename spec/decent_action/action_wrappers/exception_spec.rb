describe DecentAction::ActionWrappers::Exception do
   before { DecentAction.reset_config }

  let(:action_scope) { double(:action_scope, handler: 'handler') }

  let(:execution_context) { DecentAction::Context.new(StubAction, action_scope, {title: 'title'}) }

  let(:wrapper) { described_class.new(execution_context) }

  describe '#wrap' do
    let(:action) { 'action' }

    let(:wrap) do
      wrapper.wrap do
        action
      end
    end

    subject { wrap }

    context 'when action not rais exception' do

      it { is_expected.to eq(action)  }

    end

    context 'when exception raise in action and not handled' do
      class NotStandardError < StandardError
      end

      let(:action) { raise NotStandardError }

      context 'and not handled' do
        specify do
          expect { wrap }.to raise_error(NotStandardError)
        end
      end

      context 'when handled' do
        before do
          DecentAction.configure do |config|
            config.handle_exception(NotStandardError, Proc.new{|action| handler(action) })
          end
        end

        before do
          expect(action_scope).to receive(:handler).with(execution_context.action)
        end

        it {is_expected.to eq('handler') }

        context 'and '
      end


    end

  end

end
