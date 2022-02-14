FactoryBot.define do
  factory :search do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year_from { FFaker::Random.rand(1900..2000).to_s }
    year_to { FFaker::Random.rand(2000..2022).to_s }
    price_from { FFaker::Random.rand(0..100_000).to_s }
    price_to { FFaker::Random.rand(100_000..999_999).to_s }
    association :user, factory: :user
  end
end
