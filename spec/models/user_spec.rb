require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user, :with_searches) }
  describe 'successed create user' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
  end

  describe 'validations' do
    subject { user }

    context 'association' do
      it { is_expected.to have_many(:searches).dependent(:destroy) }
    end
  end
end
