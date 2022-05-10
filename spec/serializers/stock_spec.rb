require 'rails_helper'

RSpec.describe Serializers::Stock do
  subject { described_class.proceed(object) }

  describe '.proceed' do
    context 'when get valid object for serialization' do
      let(:stock)  { create(:stock) }
      let(:object) { Dry::Monads::Success(stock) }
      let(:expected_object) do
        {
          data: {
            id: stock.id,
            name: stock.name,
            bearer_id: stock.bearer_id
          }
        }
      end

      it { is_expected.to eq(expected_object) }
    end

    context 'when get error for serialization' do
      let(:error) { 'some errors' }
      let(:object) { Dry::Monads::Failure(error) }
      let(:expected_object) { { error: error } }

      it { is_expected.to eq(expected_object) }
    end
  end
end