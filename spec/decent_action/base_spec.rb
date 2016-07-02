describe DecentAction::Base do

  class Foo < DecentAction::Base

    contract do
      attribute :title, String
      validates :title, presence: true

      object :user do
        attribute :name, String
        validates :name, presence: true
      end
    end

  end

  let(:foo_instance) do
    Foo.new(params)
  end
  let(:params) do
    {}
  end

  describe '#contract' do

    subject { foo_instance.contract }

    context 'when params blank hash' do

      it { is_expected.not_to be_nil }

    end

    context 'when params is valid hash' do
      let(:params) do
        {title: 'title'}
      end

      it { is_expected.not_to be_nil }

      it { is_expected.to respond_to(:title) }

      specify 'should return paced parameter' do
        expect(subject.title).to eq(params[:title])
      end
    end

    context 'when use nested object within contract' do
      let(:params) do
        {title: 'title', user: {name: 'Name'}}
      end

      it { is_expected.not_to be_nil }

      it { is_expected.to respond_to(:user) }

      specify 'should parse nested object' do
        expect(subject.user.name).to eq('Name')
      end

    end

    describe '#errors' do
      before { foo_instance.valid? }
      subject { foo_instance.contract.errors_hash }
      context 'when params has errors' do
       let(:params) do
        {title: nil, user:{name: nil}}
       end

       specify 'erros should contains validation' do
         expect(subject[:title]).not_to be_nil
         expect(subject[:user]).not_to be_nil
         expect(subject[:user][:name]).not_to be_nil
       end
      end
    end

  end

  describe '#valid?' do
    subject { foo_instance.valid? }

    context 'when has params with invalid value' do

      it { is_expected.to be_falsey }

    end

    context 'when nested object parameter invalid' do
      let(:params) do
        {title: 'title', user: {}}
      end

      it { is_expected.to be_falsey }

    end

    context 'when nested object parameter blank' do
      let(:params) do
        {title: 'title'}
      end

      it { is_expected.to be_falsey }

    end

    context 'when all parameters are valid' do
      let(:params) do
        {title: 'title', user: {name: 'Name'}}
      end

      it { is_expected.to be_truthy }
    end
  end


end
