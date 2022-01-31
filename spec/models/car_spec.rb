require 'rails_helper'

RSpec.describe Car, of_type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:make).of_type(:string) }
    it { is_expected.to have_db_column(:model).of_type(:string) }
    it { is_expected.to have_db_column(:year).of_type(:integer) }
    it { is_expected.to have_db_column(:odometer).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
    it { is_expected.to have_db_column(:description).of_type(:text) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'validations' do
    context 'model presence' do
      it { is_expected.to validate_presence_of(:make) }
      it { is_expected.to validate_presence_of(:model) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:year) }
      it { is_expected.to validate_presence_of(:odometer) }
    end

    context 'model numericality' do
      it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:year).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:odometer).is_greater_than(0) }
    end

    context 'model index' do
      it { is_expected.to have_db_index(%i[make model price]) }
    end
  end
end
