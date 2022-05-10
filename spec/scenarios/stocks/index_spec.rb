require 'rails_helper'

RSpec.describe Scenarios::Stocks::Index do
  subject { described_class.call }

  describe '.call' do
    before do
      allow(Queries::Stocks).to receive(:all).and_return(stocks)
    end

    context 'when params valid' do
      let(:stocks)  { create_list(:stock, 2) }

      it { is_expected.to be_success }
    end
  end
end