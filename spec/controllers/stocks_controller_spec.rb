require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  describe 'GET .index' do
    context 'when there some stocks' do
      subject { get(:index) }

      before { create_list(:stock, 2) }

      it { is_expected.to have_http_status(:ok) }
    end
  end

  describe 'PATCH .update' do
    context '' do
      subject { patch(:update, params: params) }

      let(:stock)  { create(:stock) }
      let(:params) { { id: stock.id } }

      before { allow(Scenarios::Stocks::Update).to receive(:call).and_return(Dry::Monads::Success(stock)) }

      it { is_expected.to have_http_status(:ok) }
      xit { expect { subject }.to change(stock, :name) }
    end
  end

  describe 'DELETE .destroy' do
    context '' do
      subject { delete(:delete, params: { id: stock.id }) }

      let(:stock) { create(:stock) }

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to change(stock, :name) }
    end
  end

  describe 'GET .create' do
  end
end
