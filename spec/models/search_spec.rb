require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:make).of_type(:string) }
    it { is_expected.to have_db_column(:model).of_type(:string) }
    it { is_expected.to have_db_column(:year_from).of_type(:string) }
    it { is_expected.to have_db_column(:year_to).of_type(:string) }
    it { is_expected.to have_db_column(:price_from).of_type(:string) }
    it { is_expected.to have_db_column(:price_to).of_type(:string) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'model relations' do
    it { is_expected.to belong_to(:user) }
  end
end
