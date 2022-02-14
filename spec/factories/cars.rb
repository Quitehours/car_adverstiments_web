FactoryBot.define do
  factory :car do
    sequence(:make) { |n| FFaker::Vehicle.make + n.to_s }
    model { FFaker::Vehicle.model }
    year { FFaker::Vehicle.year.to_i }
    price { FFaker::Random.rand(999_999) }
    odometer { FFaker::Random.rand(999_999) }
    description { FFaker::Lorem.phrase }
  end
end
