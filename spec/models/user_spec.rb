require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false, default: '') }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'model validations' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'model index' do
    it { is_expected.to have_db_index(:email).unique(true) }
  end

  describe 'model relations' do
    it { is_expected.to have_many(:searches).dependent(:destroy) }
  end
end
