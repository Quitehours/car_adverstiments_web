require 'rails_helper'

FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { FFaker::Vehicle.year.to_i }
    price { FFaker::Random.rand(999_999) }
    odometer { FFaker::Random.rand(999_999) }
    description { FFaker::Lorem.phrase }
  end
end
