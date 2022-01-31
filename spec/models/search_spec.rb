require 'rails_helper'

RSpec.describe Search, type: :model do
  let(:search) { FactoryBot.create(:search) }

  describe 'successed create search' do
    it 'is valid with valid attributes' do
      expect(search).to be_valid
    end
  end

  describe 'validations' do
    subject { search }

    context 'associations' do
      it { is_expected.to belong_to(:user) }
    end
  end
end
