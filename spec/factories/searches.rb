FactoryBot.define do
  factory :search do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year_from { FFaker::Time.between(Date.new(0), Time.zone.today).year.to_s }
    year_to { FFaker::Time.between(Date.new(0), Time.zone.today).year.to_s }
    price_from { FFaker::Random.rand(999_999).to_s }
    price_to { FFaker::Random.rand(999_999).to_s }
    association :user, factory: :user
  end
end
