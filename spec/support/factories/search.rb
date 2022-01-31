require 'rails_helper'

FactoryBot.define do
  factory :search do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year_from { FFaker::Time.between(Date.new(0), Time.zone.today).year }
    year_to { FFaker::Time.between(Date.new(0), Time.zone.today).year }
    price_from { FFaker::Random.rand(999_999) }
    price_to { FFaker::Random.rand(999_999) }
    association :user, factory: :user
  end
end
