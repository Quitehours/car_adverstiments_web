require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car) { FactoryBot.create(:car) }

  describe 'successed create car' do
    it 'is valid with valid attributes' do
      expect(car).to be_valid
    end
  end

  describe 'validations' do
    subject { car }

    context 'presence' do
      it { is_expected.to validate_presence_of(:make) }
      it { is_expected.to validate_presence_of(:model) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:year) }
      it { is_expected.to validate_presence_of(:odometer) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:year).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:odometer).is_greater_than(0) }
    end
  end
end
