require 'rails_helper'

RSpec.describe Scenarios::Stocks::Create do
  subject { described_class.call(params) }

  describe '.call' do
    let(:stock) { create(:stock) }

    before do
      allow(Forms::Stocks::Create).to receive(:call).and_return(monads)
      allow(Queries::Stocks).to receive(:create).and_return(stock)
    end

    context 'when params valid' do
      let(:params) { 'valid_params' }
      let(:monads) { Dry::Monads::Success(bearer_id: 1, name: 'name') }

      it { is_expected.to be_success }
    end

    context 'when params invalid' do
      let(:params) { 'invalid_params' }
      let(:monads) { Dry::Monads::Failure('random_error') }

      it { is_expected.to be_failure }
    end
  end
end